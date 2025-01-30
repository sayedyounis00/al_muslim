import 'package:al_muslim/core/utils/images_data.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

class HidenZekrWidgetForShareOnly extends StatelessWidget {
  const HidenZekrWidgetForShareOnly({
    super.key,
    required this.screenshotController,
    required this.zkr,
  });

  final ScreenshotController screenshotController;
  final String zkr;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      color: const Color.fromRGBO(243, 232, 192, 0.99),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SpaceV(15),
          Text(
            zkr,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(height: 2, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Image.asset(
            ImageData.logo,
            height: 40,
          ),
          const Text(
            'بواسطة تطبيق المُسْلِم',
            style: TextStyle(
              fontFamily: 'Traditional Arabic',
              fontSize: 12,
              color: Color.fromARGB(211, 0, 0, 0),
            ),
          ),
          const SpaceV(10),
        ],
      ),
    );
  }
}
