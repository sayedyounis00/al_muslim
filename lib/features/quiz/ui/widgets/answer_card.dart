import 'package:al_muslim/core/storage/local_storage_service.dart';
import 'package:al_muslim/core/widgets/isnside_noti.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class AnswerCard extends StatefulWidget {
  final String ans;
  final String levelName;
  final int correctAns;
  final int index;
  final int qNowNum;
  final int qNums;
  final PageController con;
  const AnswerCard({
    super.key,
    required this.ans,
    required this.correctAns,
    required this.index,
    required this.con,
    required this.qNums,
    required this.levelName,
    required this.qNowNum,
  });

  @override
  State<AnswerCard> createState() => _AnswerCardState();
}

class _AnswerCardState extends State<AnswerCard> {
  String levelNameConverter(String? levelName) {
    switch (levelName) {
      case 'المستوي الاول':
        return 'المستوي الثاني';
      case 'المستوي الثاني':
        return 'المستوي الثالث';
      case 'المستوي الثالث':
        return 'المستوي الثالث';
      default:
        return 'المستوي الاول';
    }
  }

  int trueOrfalse = -1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.correctAns == widget.index) {
          trueOrfalse = 1;
          setState(() {});
          if ((widget.qNums - 1) == widget.qNowNum) {
            // SharedPreferences pref = await SharedPreferences.getInstance();
            pref.setString('level', levelNameConverter(widget.levelName));
            Future.delayed(
              const Duration(seconds: 1),
              () {
                InsideNotification.insideNotificationCard(
                  contentType: ContentType.success,
                  context: context,
                  title: widget.levelName,
                  content: 'تم اجتياز  ${widget.levelName}',
                );
              },
            );
            Navigator.pop(context);
          } else {
            Future.delayed(
              const Duration(milliseconds: 500),
              () {
                widget.con.nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.ease,
                );
              },
            );
          }
        } else {
          trueOrfalse = 0;
          Vibration.vibrate();
          Future.delayed(
            const Duration(seconds: 1),
            () {
              trueOrfalse = -1;
              setState(() {});
            },
          );
        }
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: trueOrfalse == 1
              ? Colors.green
              : trueOrfalse == 0
                  ? Colors.red
                  : null,
          border: Border.all(
            color: Theme.of(context).textTheme.labelLarge!.color!,
          ),
        ),
        child: Stack(
          children: [
            Icon(
              trueOrfalse == 1
                  ? Icons.done
                  : trueOrfalse == 0
                      ? Icons.close
                      : null,
              color: Theme.of(context).textTheme.labelLarge!.color,
            ),
            Center(
                child: Text(widget.ans,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelLarge!)),
          ],
        ),
      ),
    );
  }
}
