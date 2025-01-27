import 'package:al_muslim/features/settings/presentation/view%20model/cubit/setting_cubit.dart';
import 'package:al_muslim/features/settings/presentation/view/widget/colors/color_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContainerColorsListView extends StatefulWidget {
  const ContainerColorsListView({super.key});

  @override
  State<ContainerColorsListView> createState() =>
      _ContainerColorsListViewState();
}

class _ContainerColorsListViewState extends State<ContainerColorsListView> {
  int curIndex = 0;
  List<Color> cardColors() => const [
        Color(0xffdfceba), // Light Brown (بني فاتح)
        Color.fromARGB(255, 250, 223, 161), // Light Peach (خوخي فاتح)
        Color(0xffFFCDD2), // Soft Red (أحمر فاتح)
        Color(0xffBBDEFB), // Light Blue (أزرق فاتح)
        Color(0xffC8E6C9), // Mint Green (أخضر نعناعي)
        Color(0xffFFD54F), // Warm Yellow (أصفر دافئ)
        Color(0xffB39DDB), // Lavender Purple (بنفسجي خزامي)
        Color(0xffFFAB91), // Coral (مرجاني)
        Color(0xffF0F4C3), // Pale Lime (ليموني باهت)
        Color(0xffCFD8DC), // Soft Gray (رمادي ناعم)
      ];

  @override
  void initState() {
    super.initState();
    curIndex = cardColors().indexOf(context.read<SettingCubit>().conColor);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: cardColors().length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                curIndex = index;
                context
                    .read<SettingCubit>()
                    .setContainerColor(color: cardColors()[curIndex].value);
                setState(() {});
              },
              child: ColorItem(
                activeColor: Colors.black,
                color: cardColors()[index],
                isActive: index == curIndex,
              ));
        },
      ),
    );
  }
}
