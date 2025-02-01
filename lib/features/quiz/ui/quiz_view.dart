import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/quiz/data/model/quiz.dart';
import 'package:al_muslim/features/quiz/ui/widgets/answer_card.dart';
import 'package:flutter/material.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key, required this.quizList, required this.levelName});
  final List<Quiz> quizList;
  final String levelName;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(header: levelName, desc: 'اختر الاجابة الصحيحة'),
          Expanded(
            child: PageView.builder(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: quizList.length,
              reverse: true,
              itemBuilder: (context, quizIndex) {
                return Column(
                  children: [
                    const SpaceV(30),
                    Text(
                      '${quizIndex + 1}/${quizList.length}',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontSize: 35),
                    ),
                    const SpaceV(30),
                    Container(
                      width: double.infinity,
                      color: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        textAlign: TextAlign.center,
                        quizList[quizIndex].q,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(fontSize: 25),
                      ),
                    ),
                    const SpaceV(60),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: quizList[quizIndex].answers.length,
                          itemBuilder: (context, ansIndex) {
                            return AnswerCard(
                              levelName: levelName,
                              con: controller,
                              index: ansIndex,
                              qNowNum: quizIndex,
                              qNums: quizList.length,
                              correctAns: quizList[quizIndex].correctAns,
                              ans: quizList[quizIndex].answers[ansIndex],
                            );
                          },
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
