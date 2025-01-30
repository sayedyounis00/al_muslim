import 'package:al_muslim/core/helper/lang_converter.dart';
import 'package:al_muslim/features/salah/data/model/day_data.dart';
import 'package:al_muslim/features/salah/presentation/view%20model/cubit/salah_cubit.dart';
import 'package:flutter/material.dart';

class HijriDate extends StatelessWidget {
  final SalahDataSuccess state;
  const HijriDate({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    DayData date = state.dayData;
    String month = date.date.monthHName;
    String dayInAr =
        LangConverter().convertToArabic(int.parse(date.date.dayHnum));
    String yearInAr =
        LangConverter().convertToArabic(int.parse(date.date.hijriYear));
    return Text(
      '$dayInAr $month $yearInAr',
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Colors.white,
          ),
    );
  }
}
