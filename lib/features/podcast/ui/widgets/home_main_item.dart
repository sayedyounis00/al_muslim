import 'package:flutter/material.dart';

class PodcastItem extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  final String imageUrl;
  final Function() onTap;
  const PodcastItem({
    super.key,
    required this.height,
    required this.width,
    required this.radius,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.deepOrange, width: 1),
          borderRadius: BorderRadius.circular(radius),
          image:
              DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
