import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/features/quiz/data/model/quiz.dart';
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
            header: 'اختبر معلوماتك',
            desc: 'اختر مستوي الاختبار',
          ),
          Expanded(
            child: GridView(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
              ),
              children: [
                LevelCard(
                  levelName: 'المستوي الاول',
                  quizList: QuizData.level1(),
                ),
                LevelCard(
                  levelName: 'المستوي الثاني',
                  quizList: QuizData.level2(),
                ),
                LevelCard(
                  levelName: 'المستوي الثالث',
                  quizList: QuizData.level3(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
