import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;

class SuraInfoButton extends StatelessWidget {
  final int suraNum;
  const SuraInfoButton({
    super.key,
    required this.suraNum,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomTextForButtomModel(
                            title: quran.getSurahName(suraNum),
                          ),
                          CustomTextForButtomModel(
                            title: quran.getSurahNameArabic(suraNum),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Color.fromARGB(173, 196, 196, 196),
                      ),
                      // const SpaceV(30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextForButtomModel(
                            title: quran.getVerseCount(suraNum).toString(),
                          ),
                          const CustomTextForButtomModel(title: ' :عدد الآيات')
                        ],
                      ),
                      const Divider(
                        color: Color.fromARGB(173, 196, 196, 196),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextForButtomModel(
                            title:
                                quran.getSurahPages(suraNum).length.toString(),
                          ),
                          const CustomTextForButtomModel(title: ' :عدد الصفحات')
                        ],
                      ),
                      const Divider(
                        color: Color.fromARGB(173, 196, 196, 196),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextForButtomModel(
                            title: quran
                                .getPlaceOfRevelation(suraNum)
                                .toString()
                                .replaceAll('Makkah', 'مكة')
                                .replaceAll('Madinah', 'المدينة'),
                          ),
                          const CustomTextForButtomModel(title: ' :مكان النزول')
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        iconSize: 30,
        icon: Icon(Icons.info_outline,
            color: Theme.of(context).textTheme.labelLarge!.color),
      ),
    );
  }
}

class CustomTextForButtomModel extends StatelessWidget {
  final String title;
  const CustomTextForButtomModel({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 23),
    );
  }
}
