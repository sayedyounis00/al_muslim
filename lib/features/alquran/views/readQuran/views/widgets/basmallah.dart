import 'package:flutter/material.dart';

class Basmalah extends StatelessWidget {
  const Basmalah({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenSize.width,
      child: Padding(
        padding: EdgeInsets.only(
            left: (screenSize.width * .2),
            right: (screenSize.width * .2),
            top: 8,
            bottom: 2),
        child: Image.asset(
          "assets/images/Basmala.png",
          color: Theme.of(context).textTheme.labelLarge!.color,
          width: MediaQuery.of(context).size.width * .4,
        ),
      ),
    );
  }
}
