import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture_boilerplate/constants/constants.dart';
import 'package:flutter_clean_architecture_boilerplate/infrastructure/local_storage/references_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

///  Store data in secure storage.
///
/// Keychain is used for iOS
/// AES encryption is used for Android. AES secret key is encrypted with RSA and RSA key is stored in KeyStore
/// Web use WebCrypto for encrypted strings in local_storage
/// libsecret is used for Linux.
class SecureStorage implements PreferencesRepository {
  final _storage = const FlutterSecureStorage();

  @override
  Future<bool?> getBool(String key) {
    throw UnimplementedError();
  }

  @override
  Future<bool> setBool(String key, bool value) {
    throw UnimplementedError();
  }

  @override
  Future<String?> getString(String key) async {
    return await _storage.read(key: key + APP_NAME);
  }

  @override
  Future<bool> setString(String key, String value) async {
    _storage.write(key: key + APP_NAME, value: value);
    return true;
  }

  @override
  Future<bool> clear() async {
    _storage.deleteAll();
    return true;
  }

  @override
  Future<bool> haveKey(String key) async {
    return _storage.containsKey(key: key + APP_NAME);
  }
}

final secureStoreProvider = Provider<PreferencesRepository>((ref) {
  return SecureStorage();
});
