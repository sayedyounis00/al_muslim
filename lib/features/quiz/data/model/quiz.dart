class Quiz {
  final String q;
  final List<String> answers;
  final int correctAns;
  Quiz({
    required this.q,
    required this.answers,
    required this.correctAns,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      q: json['q'] as String,
      answers: List<String>.from(json['answers']),
      correctAns: json['correctAns'] as int,
    );
  }
}
