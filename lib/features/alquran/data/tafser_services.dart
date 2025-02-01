import 'dart:developer';

import 'package:al_muslim/features/alquran/data/model/tafser_model.dart';
import 'package:dio/dio.dart';

class TafserServices {
  Dio dio = Dio();
  late Response response;

  Future<List<TafserModel>> fetchTafser({required int swrahNum}) async {
    try {
      response = await dio.get(
          'https://quranenc.com/api/v1/translation/sura/arabic_moyassar/$swrahNum');
    } on DioException catch (e) {
      log(e.error.toString());
    }

    List<Map<String, dynamic>> tafserMap = [];
    for (var item in response.data['result']) {
      tafserMap.add(item);
    }
    List<TafserModel> tafserList = [];
    for (var item in tafserMap) {
      tafserList.add(TafserModel.fromJson(item));
    }
    return tafserList;
  }
}
