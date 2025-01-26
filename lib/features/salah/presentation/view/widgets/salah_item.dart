import 'package:al_muslim/core/helper/time_helper.dart';
import 'package:al_muslim/core/utils/constants.dart';
import 'package:flutter/material.dart';

class SalahItem extends StatelessWidget {
  const SalahItem({
    super.key,
    required this.title,
    required this.time,
  });
  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    String salahTime = TimeHelper.time12(time: time);
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.kBgColDark),
            ),
            Text(
              salahTime,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: AppColors.kBgColDark),
            ),
          ],
        ),
      ),
    );
  }
}
