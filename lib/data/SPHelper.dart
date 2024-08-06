import 'package:shared_preferences/shared_preferences.dart';

class Sphelper {
  static const keyName = "name";
  static const keyImage = "image";

  Future<bool> setSettings(String name, String image) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(keyName, name);
      prefs.setString(keyImage, image);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  Future<Map<String, String>> getSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      return {
        "name": prefs.getString(keyName) ?? "",
        "image": prefs.getString(keyImage) ?? "",
      };
    } on Exception catch (_) {
      return {};
    }
  }
}
