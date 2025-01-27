import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/settings/presentation/view/widget/colors/color_list_view.dart';
import 'package:al_muslim/features/settings/presentation/view/widget/colors/container_colors_list_view.dart';
import 'package:flutter/material.dart';

class ColorsButtomSheet extends StatelessWidget {
  const ColorsButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SpaceV(10),
        Text(
          'تعديل الألوان',
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(fontSize: 22, color: Colors.orange),
        ),
        const SpaceV(10),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Text(
            'تعديل لون الخلفية (الوضع الليلي)',
            textAlign: TextAlign.end,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontSize: 22, color: Colors.white),
          ),
        ),
        const ColorListView(),
        const SpaceV(10),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Text(
            'تعديل لون الحاوية',
            textAlign: TextAlign.end,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontSize: 22, color: Colors.white),
          ),
        ),
        const ContainerColorsListView()
      ],
    );
  }
}
