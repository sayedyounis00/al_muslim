import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.isActive,
    required this.activeColor,
    required this.color,
  });
  final bool isActive;
  final Color color;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CircleAvatar(
          radius: 27,
          backgroundColor: color,
          child: isActive == true
              ?  Center(
                  child: Icon(
                    Icons.done,
                    color: activeColor,
                  ),
                )
              : null),
    );
  }
}
