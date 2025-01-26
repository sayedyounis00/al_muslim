import 'dart:convert';
import 'package:al_muslim/features/alquran/data/model/fehres_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FehresService {
  Dio dio = Dio();
  Future<void> getAllSwar() async {
    Response response = await dio.get('https://mp3quran.net/api/v3/suwar');
    //setToDataBase
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('fehres', jsonEncode(response.data));
  }

  Future<List<SwarModel>> getFromDataBase() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Map<String, dynamic> response = jsonDecode(pref.getString('fehres') ?? '');

    List<Map<String, dynamic>> swarMap = [];
    for (var item in response['suwar']) {
      swarMap.add(item);
    }
    List<SwarModel> swarModel = [];
    for (var item in swarMap) {
      swarModel.add(SwarModel.fromJson(item));
    }
    return swarModel;
  }
}
