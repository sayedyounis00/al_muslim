import 'dart:convert';

import 'package:al_muslim/core/networking/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static Future<void> setToLDB(
      {required String keyInLDB, required String apiLink}) async {
    dynamic dataFromApi = await ApiServices().getData(endPoint: apiLink);

    String dataEncoded = jsonEncode(dataFromApi);
    SharedPreferences asyncPref = await SharedPreferences.getInstance();
    asyncPref.setString(keyInLDB, dataEncoded);
  }

  static getFromLDB({required String key}) async {
    SharedPreferences asyncPref = await SharedPreferences.getInstance();
    String data = asyncPref.getString(key) ?? '';
    dynamic jsonData = jsonDecode(data);

    return jsonData;
  }

  static hasDataInLDB({required String key}) async {
    SharedPreferences asyncPref = await SharedPreferences.getInstance();
    bool hasData = asyncPref.containsKey(key);

    return hasData;
  }
}
