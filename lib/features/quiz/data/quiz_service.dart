import 'dart:convert';

import 'package:al_muslim/features/quiz/data/model/level.dart';
import 'package:flutter/services.dart';

class QuizService {
  static Future<List<Level>> getQuizData() async {
    String jsonString = await rootBundle.loadString('assets/jsons/quizs.json');

    List<dynamic> jsonList = json.decode(jsonString);

    List<Level> levelsList = [];
    for (var element in jsonList) {
      levelsList.add(Level.fromJson(element));
    }

    return levelsList;
  }
}
