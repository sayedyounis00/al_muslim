class Quiz {
  final String q;
  final List<String> answers;
  final int correctAns;
  Quiz({
    required this.q,
    required this.answers,
    required this.correctAns,
  });
}

class QuizData {
  static List<Quiz> level1() => [
        Quiz(
          q: 'كم عدد السور في القران الكريم',
          answers: ['50', '120', '114', '155'],
          correctAns: 2,
        ),
        Quiz(
          q: 'من مبطلات الصلاة',
          answers: [
            'حلق اللحي',
            'عدم الوضوء',
            'الاثنان معا',
            'لا توجد اجابة صحيحه'
          ],
          correctAns: 1,
        ),
      ];

  static List<Quiz> level2() => [
        Quiz(
          q: 'كم عدد السور في القران الكريم',
          answers: ['50', '120', '114', '155'],
          correctAns: 2,
        ),
      ];

  static List<Quiz> level3() => [
        Quiz(
          q: 'كم عدد السور في القران الكريم',
          answers: ['50', '120', '114', '155'],
          correctAns: 2,
        ),
        Quiz(
          q: 'من مبطلات الصلاة',
          answers: [
            'حلق اللحي',
            'عدم الوضوء',
            'الاثنان معا',
            'لا توجد اجابة صحيحه'
          ],
          correctAns: 1,
        ),
        Quiz(
          q: 'كم عدد السور في القران الكريم',
          answers: ['50', '120', '114', '155'],
          correctAns: 2,
        ),
        Quiz(
          q: 'من مبطلات الصلاة',
          answers: [
            'حلق اللحي',
            'عدم الوضوء',
            'الاثنان معا',
            'لا توجد اجابة صحيحه'
          ],
          correctAns: 1,
        ),
        Quiz(
          q: 'كم عدد السور في القران الكريم',
          answers: ['50', '120', '114', '155'],
          correctAns: 2,
        ),
        Quiz(
          q: 'من مبطلات الصلاة',
          answers: [
            'حلق اللحي',
            'عدم الوضوء',
            'الاثنان معا',
            'لا توجد اجابة صحيحه'
          ],
          correctAns: 1,
        ),
        Quiz(
          q: 'كم عدد السور في القران الكريم',
          answers: ['50', '120', '114', '155'],
          correctAns: 2,
        ),
        Quiz(
          q: 'من مبطلات الصلاة',
          answers: [
            'حلق اللحي',
            'عدم الوضوء',
            'الاثنان معا',
            'لا توجد اجابة صحيحه'
          ],
          correctAns: 1,
        ),
      ];
}
