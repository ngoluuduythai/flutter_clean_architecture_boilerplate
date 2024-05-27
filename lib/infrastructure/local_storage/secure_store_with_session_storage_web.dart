library flutter_secure_storage_web;

import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:typed_data';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js_util' as js_util;
import 'package:flutter_clean_architecture_boilerplate/constants/constants.dart';
import 'package:flutter_clean_architecture_boilerplate/infrastructure/local_storage/secure_store_with_session.dart';

import './subtle.dart' as crypto;

SecureStorageWithSesison? getSecureStorageSession() =>
    FlutterSecureStorageWebWithSessionStorage();

class FlutterSecureStorageWebWithSessionStorage
    implements SecureStorageWithSesison {
  static const _PUBLIC_KEY = 'publicKey';

  Future<bool> _containsKey({
    required String key,
    required Map<String, String> options,
  }) =>
      Future.value(html.window.sessionStorage
          .containsKey("${options[_PUBLIC_KEY]!}.$key"));

  Future<void> delete({
    required String key,
    required Map<String, String> options,
  }) =>
      Future.value(
          html.window.sessionStorage.remove("${options[_PUBLIC_KEY]!}.$key"));

  Future<void> _deleteAll({
    required Map<String, String> options,
  }) =>
      Future.sync(
          () => html.window.sessionStorage.removeWhere((key, value) => true));

  Future<String?> _read({
    required String key,
    required Map<String, String> options,
  }) async {
    final value = html.window.sessionStorage["${options[_PUBLIC_KEY]!}.$key"];

    return await _decryptValue(value, options);
  }

  Future<Map<String, String>> readAll({
    required Map<String, String> options,
  }) async {
    final map = <String, String>{};
    final prefix = "${options[_PUBLIC_KEY]!}.";
    for (int j = 0; j < html.window.sessionStorage.length; j++) {
      final entry = html.window.sessionStorage.entries.elementAt(j);
      if (!entry.key.startsWith(prefix)) {
        continue;
      }

      final value = await _decryptValue(entry.value, options);

      if (value == null) {
        continue;
      }

      map[entry.key.substring(prefix.length)] = value;
    }

    return map;
  }

  crypto.Algorithm _getAlgorithm(Uint8List iv) =>
      crypto.Algorithm(name: 'AES-GCM', length: 256, iv: iv);

  Future<html.CryptoKey> _getEncryptionKey(
      crypto.Algorithm algorithm, Map<String, String> options) async {
    late html.CryptoKey encryptionKey;
    final key = options[_PUBLIC_KEY]!;

    if (html.window.sessionStorage.containsKey(key)) {
      final jwk = base64Decode(html.window.sessionStorage[key]!);

      encryptionKey = await js_util.promiseToFuture<html.CryptoKey>(
        crypto.importKey("raw", jwk, algorithm, false, ["encrypt", "decrypt"]),
      );
    } else {
      //final crypto.getRandomValues(Uint8List(256));

      encryptionKey = await js_util.promiseToFuture<html.CryptoKey>(
        crypto.generateKey(algorithm, true, ["encrypt", "decrypt"]),
      );

      final jsonWebKey = await js_util
          .promiseToFuture<ByteBuffer>(crypto.exportKey("raw", encryptionKey));
      html.window.sessionStorage[key] = base64Encode(jsonWebKey.asUint8List());
    }

    return encryptionKey;
  }

  Future<void> _write({
    required String key,
    required String value,
    required Map<String, String> options,
  }) async {
    final iv =
        html.window.crypto!.getRandomValues(Uint8List(12)).buffer.asUint8List();

    final algorithm = _getAlgorithm(iv);

    final encryptionKey = await _getEncryptionKey(algorithm, options);

    final encryptedContent = await js_util.promiseToFuture<ByteBuffer>(
      crypto.encrypt(
        algorithm,
        encryptionKey,
        Uint8List.fromList(
          utf8.encode(value),
        ),
      ),
    );

    final encoded =
        "${base64Encode(iv)}.${base64Encode(encryptedContent.asUint8List())}";

    html.window.sessionStorage["${options[_PUBLIC_KEY]!}.$key"] = encoded;
  }

  Future<String?> _decryptValue(
    String? cypherText,
    Map<String, String> options,
  ) async {
    if (cypherText == null) {
      return null;
    }

    final parts = cypherText.split(".");

    final iv = base64Decode(parts[0]);
    final algorithm = _getAlgorithm(iv);

    final decryptionKey = await _getEncryptionKey(algorithm, options);

    final value = base64Decode(parts[1]);

    final decryptedContent = await js_util.promiseToFuture<ByteBuffer>(
      crypto.decrypt(
        _getAlgorithm(iv),
        decryptionKey,
        Uint8List.fromList(value),
      ),
    );

    final plainText = utf8.decode(decryptedContent.asUint8List());

    return plainText;
  }

  @override
  Future<bool?> getBool(String key) {
    throw UnimplementedError();
  }

  @override
  Future<bool> setBool(String key, bool value) {
    throw UnimplementedError();
  }

  final options = <String, String>{
    'dbName': 'MyAppFlutterEncryptedStorage',
    'publicKey': 'MyAppFlutterSecureStorage',
  };

  @override
  Future<String?> getString(String key) async {
    return await _read(key: key + APP_NAME, options: options);
  }

  @override
  Future<bool> setString(String key, String value) async {
    _write(key: key + APP_NAME, value: value, options: options);
    return true;
  }

  @override
  Future<bool> clear() async {
    _deleteAll(options: options);
    return true;
  }

  @override
  Future<bool> haveKey(String key) async {
    return _containsKey(key: key + APP_NAME, options: options);
  }
}
