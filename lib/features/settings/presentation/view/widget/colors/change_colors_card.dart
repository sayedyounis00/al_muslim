import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/settings/presentation/view/widget/colors/colors_buttom_sheet.dart';
import 'package:flutter/material.dart';

class ChangeColorsCard extends StatelessWidget {
  const ChangeColorsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          showModalBottomSheet(
            elevation: 50000,
            barrierColor: const Color.fromARGB(62, 0, 0, 0),
            backgroundColor: Colors.black,
            showDragHandle: true,
            context: context,
            builder: (context) {
              return const ColorsButtomSheet();
            },
          );
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'تعديل الألوان',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 18, color: Colors.black),
                ),
                const SpaceH(10),
                const Icon(Icons.color_lens_outlined, color: Colors.black),
                const SpaceH(5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
