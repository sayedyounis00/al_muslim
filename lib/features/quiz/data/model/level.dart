import 'package:al_muslim/features/quiz/data/model/quiz.dart';

class Level {
  final String level;
  final List<Quiz> data;

  Level({
    required this.level,
    required this.data,
  });

  // دالة fromJson لتحويل الـ JSON إلى كائن Level
  factory Level.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Quiz> quizList = list.map((i) => Quiz.fromJson(i)).toList();
    
    return Level(
      level: json['level'],
      data: quizList,
    );
  }
}