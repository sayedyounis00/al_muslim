import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/athkar/data/models/zkr_item.dart';
import 'package:al_muslim/features/athkar/views/widgets/share_and_fav_row.dart';
import 'package:flutter/material.dart';

class ZekrCard extends StatelessWidget {
  final ZkrItem azkar;
  const ZekrCard({super.key, required this.azkar});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).textTheme.labelLarge!.color!),
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        child: Column(
          children: [
            Text(
              azkar.text,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style:
                  Theme.of(context).textTheme.labelLarge!.copyWith(height: 2),
            ),
            const SpaceV(10),
            ShareAndFavRow(
              azkar: azkar,
            ),
          ],
        ));
  }
}
