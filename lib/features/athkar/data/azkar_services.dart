import 'dart:convert';
import 'package:al_muslim/features/athkar/data/models/azkar_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class AzkarServices {
  Future<List<AzkarModel>> getAzkarData() async {
    String azkarString =
        await rootBundle.loadString('assets/jsons/adhkar.json');

    var azkarJsonData = json.decode(azkarString);
    List<AzkarModel> azkarList = [];
    for (Map<String, dynamic> item in azkarJsonData) {
      AzkarModel zkr = AzkarModel.fromJson(item);
      azkarList.add(zkr);
    }

    return azkarList;
  }
}
