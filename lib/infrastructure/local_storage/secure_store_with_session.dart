import 'package:flutter_clean_architecture_boilerplate/infrastructure/local_storage/references_repository.dart';

import 'secure_store_with_session_stub.dart'
    if (dart.library.io) 'secure_store_with_session_native.dart'
    if (dart.library.js) 'secure_store_with_session_storage_web.dart';
///  Store data in secure storage.
///
/// Keychain is used for iOS
/// AES encryption is used for Android. AES secret key is encrypted with RSA and RSA key is stored in KeyStore
/// Web use WebCrypto for encrypted strings in local_storage
/// libsecret is used for Linux.
abstract class SecureStorageWithSesison implements PreferencesRepository {
  static SecureStorageWithSesison? _instance;

  static SecureStorageWithSesison? get instance {
    _instance ??= getSecureStorageSession();
    return _instance;
  }

  @override
  Future<bool?> getBool(String key);

  @override
  Future<bool> setBool(String key, bool value);

  @override
  Future<String?> getString(String key);
  @override
  Future<bool> setString(String key, String value);
}