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
        height: 50,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
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
