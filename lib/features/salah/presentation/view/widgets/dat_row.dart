import 'package:al_muslim/core/helper/lang_converter.dart';
import 'package:al_muslim/core/widgets/icon_back.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/salah/data/model/day_data.dart';
import 'package:flutter/material.dart';

class DayRow extends StatelessWidget {
  const DayRow({
    super.key,
    required this.dayData,
  });
  final DayData dayData;

  @override
  Widget build(BuildContext context) {
    String dayInAr =
        LangConverter().convertToArabic(int.parse(dayData.date.dayHnum));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SpaceH(0),
          Column(
            children: [
              Text(dayInAr,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 20)),
              Text(
                dayData.date.monthHName,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 23),
              ),
            ],
          ),
          const SpaceH(0),
          Column(
            children: [
              Text(dayData.date.dayName,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SpaceV(5),
              Card(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    DateTime.now().toString().split(' ')[0],
                    style: const TextStyle(
                        fontSize: 15,
                        fontFamily: AutofillHints.addressCityAndState),
                  ),
                ),
              ),
            ],
          ),
          const SpaceH(0),
          const IconBackk(),
          const SpaceH(0),
        ],
      ),
    );
  }
}
