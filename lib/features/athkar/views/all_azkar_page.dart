import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/features/athkar/data/azkar_services.dart';
import 'package:al_muslim/features/athkar/views/widgets/zekr_category_card.dart';
import 'package:flutter/material.dart';

class ALlAzkarView extends StatelessWidget {
  const ALlAzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(header: 'الاذكار', desc: ''),
          FutureBuilder(
            future: AzkarServices().getAzkarData(),
            builder: (conext, snapShot) {
              if (snapShot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: snapShot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ZekrCategoryCard(zkr: snapShot.data![index]);
                    },
                  ),
                );
              } else if (snapShot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(color: Colors.orange));
              } else {
                return const Text('error');
              }
            },
          ),
        ],
      ),
    );
  }
}
