import 'dart:convert';

import 'package:al_muslim/core/networking/services.dart';
import 'package:al_muslim/core/storage/local_storage_service.dart';

class StorageService {
  static Future<void> setToLDB(
      {required String keyInLDB, required String apiLink}) async {
    dynamic dataFromApi = await ApiServices().getData(endPoint: apiLink);

    String dataEncoded = jsonEncode(dataFromApi);
    // SharedPreferences asyncPref = await SharedPreferences.getInstance();
    pref.setString(keyInLDB, dataEncoded);
  }

  static getFromLDB({required String key})  {
    // SharedPreferences asyncPref = await SharedPreferences.getInstance();
    String data = pref.getString(key) ?? '';
    dynamic jsonData = jsonDecode(data);

    return jsonData;
  }

  static hasDataInLDB({required String key})  {
    // SharedPreferences pref = await SharedPreferences.getInstance();
    bool hasData = pref.containsKey(key);

    return hasData;
  }
}
