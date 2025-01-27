import 'package:al_muslim/features/settings/presentation/view%20model/cubit/setting_cubit.dart';
import 'package:al_muslim/features/settings/presentation/view/widget/colors/color_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int curIndex = 0;
  List<Color> kColors() => const [
        Color(0xff001427), // Navy Blue (أزرق بحري داكن)
        Color(0xff212121), // Charcoal Black (أسود فحمي)
        Color(0xff2C2C54), // Dark Purple (أرجواني غامق)
        Color(0xff8B0000), // Dark Red (أحمر داكن)
        Color(0xff3D348B), // Deep Indigo (نيلي داكن)
        Color(0xff1B1B1B), // Almost Black (أسود داكن جدًا)
        Color(0xff5C2A9D), // Dark Violet (بنفسجي داكن)
        Color(0xff0F4C5C), // Deep Teal (أخضر مائل للأزرق داكن)
        Color(0xff4E342E), // Dark Brown (بني داكن)
        Color.fromARGB(255, 0, 0, 0),
        Color(0xff37474F), // Blue Gray (رمادي مزرق)
      ];

  @override
  void initState() {
    super.initState();
    curIndex = kColors().indexOf(context.read<SettingCubit>().myColor);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: kColors().length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                curIndex = index;
                context
                    .read<SettingCubit>()
                    .setbgColor(color: kColors()[curIndex].value);
                setState(() {});
              },
              child: ColorItem(
                activeColor: Colors.white,
                color: kColors()[index],
                isActive: index == curIndex,
              ));
        },
      ),
    );
  }
}
