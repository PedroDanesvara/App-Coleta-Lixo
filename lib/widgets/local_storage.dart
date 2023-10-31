import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late SharedPreferences _prefs;

  _initPrefs() async {
    print("Instanciei a _prefs no init");
    _prefs = await SharedPreferences.getInstance();
  }


  loadFromPrefs({required String keyName}) async {
    await _initPrefs();
    print("Instanciei a _prefs no load");
    return _prefs.get(keyName);
  }


  saveToPrefs({required String keyName, required String value}) async {
    print("To no save antes de dar initPrefs");
    await _initPrefs();
    print("Instanciei a _prefs no save");
    _prefs.setString(keyName, value);
  }
}