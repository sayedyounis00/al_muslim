import 'dart:developer';

import 'package:al_muslim/core/networking/services.dart';
import 'package:al_muslim/features/hadith/data/model/hadith_model.dart';
import 'package:hive/hive.dart';

class HadithServices {
  Future<List<HadithModel>> getHadithData({required String sahehName}) async {
    Map<String, dynamic> data = await ApiServices().getData(
      endPoint:
          'https://hadis-api-id.vercel.app/hadith/$sahehName?page=6&limit=80',
    );

    List<HadithModel> hadithList = [];
    if (hadithList.isEmpty) {
      for (var element in data['items']) {
        hadithList.add(HadithModel.fromJson(element));
      }
    }

    return hadithList;
  }

// في حالة الضغط على زر التحميل فقط
  Future<void> setHadithInLDB({required String sahehName}) async {
    var hadithBox = Hive.box('hadith');
    try {
      await hadithBox.put(
        sahehName,
        await ApiServices().getData(
          endPoint:
              'https://hadis-api-id.vercel.app/hadith/$sahehName?page=6&limit=80',
        ),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<HadithModel>> getHadithFromLDB({
    required String sahehName,
  }) async {
    var hadithBox = Hive.box('hadith');
    var data = hadithBox.get(sahehName);

    List<HadithModel> hadithList = [];
    if (hadithList.isEmpty) {
      for (var element in data['items']) {
        hadithList.add(HadithModel.fromJson(element));
      }
    }
    return hadithList;
  }
}
