import 'package:al_muslim/features/quiz/data/model/quiz.dart';
import 'package:al_muslim/features/quiz/ui/quiz_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LevelCard extends StatefulWidget {
  final List<Quiz> quizList;
  final String levelName;
  const LevelCard({
    super.key,
    required this.quizList,
    required this.levelName,
  });

  @override
  State<LevelCard> createState() => _LevelCardState();
}

class _LevelCardState extends State<LevelCard> {
  int userLevel = 1;
  @override
  void initState() {
    loadLevelCompleted();
    super.initState();
  }

  void loadLevelCompleted() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // pref.remove('level');
    userLevel = levelNameConverter(pref.getString('level'));
    setState(() {});
  }

  int levelNameConverter(String? levelName) {
    switch (levelName) {
      case 'المستوي الاول':
        return 1;
      case 'المستوي الثاني':
        return 2;
      case 'المستوي الثالث':
        return 3;
      default:
        return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    loadLevelCompleted();
    return Opacity(
      opacity: (userLevel >= levelNameConverter(widget.levelName)) ? 1 : .4,
      child: InkWell(
        onTap: (userLevel >= levelNameConverter(widget.levelName))
            ? () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: QuizView(
                      quizList: widget.quizList,
                      levelName: widget.levelName,
                    ),
                  ),
                );
              }
            : null,
        borderRadius: BorderRadius.circular(12),
        customBorder: Border.all(),
        child: Card(
          child: Center(
            child: Text(
              widget.levelName,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
