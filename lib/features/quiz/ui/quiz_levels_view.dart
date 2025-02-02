import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/features/quiz/data/quiz_service.dart';
import 'package:al_muslim/features/quiz/ui/widgets/level_card.dart';
import 'package:flutter/material.dart';

class QuizLevelsView extends StatelessWidget {
  const QuizLevelsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            header: 'اختبر معلوماتك الدينية',
            desc: 'اختر مستوي الاختبار',
          ),
          Expanded(
            child: FutureBuilder(
              future: QuizService.getQuizData(),
              builder: (context, snap) {
                if (snap.hasData) {
                  return GridView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,
                    ),
                    children: [
                      LevelCard(
                        levelName: 'المستوي الاول',
                        quizList: snap.data![0].data,
                      ),
                      LevelCard(
                        levelName: 'المستوي الثاني',
                        quizList: snap.data![1].data,
                      ),
                      LevelCard(
                        levelName: 'المستوي الثالث',
                        quizList: snap.data![2].data,
                      ),
                    ],
                  );
                } else if (snap.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  );
                } else if (snap.hasError) {
                  return Text(snap.error.toString());
                } else {
                  return const SizedBox();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
