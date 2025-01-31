import 'package:flutter/material.dart';

class PageCover extends StatelessWidget {
  final String? image;

  const PageCover({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(
      'assets/images/Radio_logo.png',
      scale: 3,
    ));
  }
}
