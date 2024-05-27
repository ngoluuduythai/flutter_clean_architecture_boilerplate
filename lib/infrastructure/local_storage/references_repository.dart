
abstract class PreferencesRepository {
  Future<bool> setString(String key, String value) ;
  Future<String?> getString(String key);
  Future<bool> setBool(String key, bool value);
  Future<bool?> getBool(String key);
  Future<bool> clear();
  Future<bool> haveKey(String key);
}
