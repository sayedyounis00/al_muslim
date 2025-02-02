import 'package:al_muslim/features/athkar/data/models/azkar_model.dart';
import 'package:al_muslim/features/athkar/views/reading_azkar_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ZekrCategoryCard extends StatelessWidget {
  final AzkarModel zkr;
  const ZekrCategoryCard({super.key, required this.zkr});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            alignment: Alignment.center,
            child: AzkarRead(zkr: zkr),
            type: PageTransitionType.fade,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .color!
                  .withOpacity(0.8)),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.arrow_back_ios_rounded),
            Text(zkr.category, style: Theme.of(context).textTheme.labelLarge!),
          ],
        ),
      ),
    );
  }
}
