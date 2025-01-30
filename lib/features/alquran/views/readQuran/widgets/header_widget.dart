import 'package:flutter/material.dart';
import 'package:quran/quran.dart';

class HeaderWidget extends StatelessWidget {
  final int pageIndex;
  final bool forYousef;
  const HeaderWidget({
    super.key,
    required this.pageIndex,
    this.forYousef = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/888-02.png",
              width: MediaQuery.of(context).size.width,
              height: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.7, vertical: 7),
            child: Text(
              'سورة ${getSurahNameArabic(pageIndex + 1)}',
              style: TextStyle(
                // fontFamily: "arsura",
                fontSize: forYousef ? 18 : 22,
                color: forYousef
                    ? Colors.black
                    : Theme.of(context).textTheme.labelLarge!.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
