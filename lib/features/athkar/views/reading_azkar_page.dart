import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/features/athkar/data/models/azkar_model.dart';
import 'package:al_muslim/features/athkar/views/widgets/zekr_card.dart';
import 'package:flutter/material.dart';

class AzkarRead extends StatelessWidget {
  final AzkarModel zkr;
  const AzkarRead({super.key, required this.zkr});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child:
                IconBack(col: Theme.of(context).textTheme.labelLarge!.color!),
          ),
        ],
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          zkr.category,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(fontFamily: 'IBMPlex', height: 1.6),
        ),
      ),
      body: ListView.builder(
        itemCount: zkr.azkarList.length,
        itemBuilder: (BuildContext context, int index) {
          return ZekrCard(
            azkar: zkr.azkarList[index],
          );
        },
      ),
    );
  }
}
