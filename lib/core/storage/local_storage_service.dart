import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences pref;

class LocalStorageService {
  static Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }
}
