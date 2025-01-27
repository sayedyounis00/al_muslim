import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/settings/presentation/view/widget/colors/change_colors_card.dart';
import 'package:al_muslim/features/settings/presentation/view/widget/change_font_card.dart';
import 'package:al_muslim/features/settings/presentation/view/widget/change_theme_cards.dart';
import 'package:al_muslim/features/settings/presentation/view/widget/sound_card.dart';
import 'package:flutter/material.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CustomAppBar(header: 'الإعدادات', desc: ''),
        const SpaceV(8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'المظهر',
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SpaceV(5),
        const Divider(height: 0),
        const ChangeThemeCard(),
        const SpaceV(12),
        const ChangeColorsCard(),
        const SpaceV(12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'حجم الخط',
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const ChangeFontCard(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'الاشعارات',
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SoundCard(),
        const Spacer(),
        const SpaceV(25),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(text: '', children: [
            TextSpan(
                text: 'تم تطوير التطبيق بواسطه\n ',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: 20)),
            TextSpan(
                text: 'يوسف دويدار',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: 20)),
            const TextSpan(text: '   '),
            const TextSpan(
                text: '&',
                style: TextStyle(color: Colors.orange, fontSize: 25)),
            const TextSpan(text: '   '),
            TextSpan(
                text: 'سيد سيف',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: 20)),
          ]),
        ),
        const SpaceV(50),
      ],
    );
  }
}

