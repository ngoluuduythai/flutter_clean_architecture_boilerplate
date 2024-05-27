import 'package:flutter_clean_architecture_boilerplate/constants/constants.dart';
import 'package:flutter_clean_architecture_boilerplate/infrastructure/local_storage/references_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage implements PreferencesRepository {
  static final LocalStorage _localStorage = LocalStorage._internal();

  factory LocalStorage() => _localStorage;

  LocalStorage._internal();

  _getSharedPreference() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<bool?> getBool(String key) async {
    SharedPreferences sharedPreferences = await _getSharedPreference();
    return sharedPreferences.getBool(key + APP_NAME);
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    SharedPreferences sharedPreferences = await _getSharedPreference();
    return await sharedPreferences.setBool(key + APP_NAME, value);
  }

  @override
  Future<bool> setString(String key, String value) async {
    SharedPreferences sharedPreferences = await _getSharedPreference();
    return await sharedPreferences.setString(key + APP_NAME, value);
  }

  @override
  Future<String?> getString(String key) async {
    SharedPreferences sharedPreferences = await _getSharedPreference();
    return sharedPreferences.getString(key + APP_NAME);
  }

  @override
  Future<bool> clear() async {
    SharedPreferences sharedPreferences = await _getSharedPreference();
    return sharedPreferences.clear();
  }

  @override
  Future<bool> haveKey(String key) async {
    SharedPreferences sharedPreferences = await _getSharedPreference();
    return sharedPreferences.containsKey(key + APP_NAME);
  }
}

final localStoreProvider = Provider<PreferencesRepository>((ref) {
  return LocalStorage();
});
