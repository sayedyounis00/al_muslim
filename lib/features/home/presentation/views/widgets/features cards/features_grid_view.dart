import 'package:al_muslim/core/utils/images_data.dart';
import 'package:al_muslim/features/asma%20allah/ui/asmaa_allah_view.dart';
import 'package:al_muslim/features/athkar/views/all_azkar_page.dart';
import 'package:al_muslim/features/favorites/presentation/view/fav_view.dart';
import 'package:al_muslim/features/hadith/presentation/view/hadith_view.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/features%20cards/feature_card.dart';
import 'package:al_muslim/features/podcast/ui/all_podcast_screen.dart';
import 'package:al_muslim/features/qubla/presentation/views/qibla_view.dart';
import 'package:al_muslim/features/radio/views/all_radios_view.dart';
import 'package:al_muslim/features/radio/views/masr_radio_view.dart';
import 'package:al_muslim/features/sabha/presentation/views/sebha_view.dart';
import 'package:al_muslim/features/salah/presentation/view/salah_view.dart';
import 'package:al_muslim/features/sera/presentation/views/sera_view.dart';
import 'package:flutter/material.dart';

class FeaturesGridView extends StatelessWidget {
  const FeaturesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .32,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                children: [
                  FeatureCard(
                    title: 'الأحاديث',
                    imagePath: ImageData.book,
                    navigateTo: const HadithView(),
                  ),
                  FeatureCard(
                    title: 'الصلاة',
                    imagePath: ImageData.prayTime,
                    navigateTo: const SalahView(),
                  ),
                  FeatureCard(
                    title: 'رأديو',
                    imagePath: ImageData.radio,
                    navigateTo: const AllRadiosView(),
                  ),
                  FeatureCard(
                    title: 'الأذكار',
                    imagePath: ImageData.azkar,
                    navigateTo: const ALlAzkarView(),
                  ),
                  FeatureCard(
                    title: ' اذاعه مصر',
                    imagePath: ImageData.radioMasr,
                    navigateTo: const RadioMasrView(),
                  ),
                  FeatureCard(
                    title: 'المفضلة',
                    imagePath: ImageData.bookmark,
                    navigateTo: const FavView(),
                  ),
                  FeatureCard(
                    navigateTo: const QiblaView(),
                    title: 'القبلة',
                    imagePath: ImageData.qibla,
                  ),
                  FeatureCard(
                    title: 'السبحة',
                    imagePath: ImageData.thbha,
                    navigateTo: const SebhaView(),
                  ),
                  FeatureCard(
                    title: 'السيرة النبوية',
                    navigateTo: const SeraView(),
                    imagePath: ImageData.sera,
                  ),
                  FeatureCard(
                    navigateTo: const AsmaaAllahView(),
                    title: 'اسماء الله',
                    imagePath: ImageData.allah,
                  ),
                  FeatureCard(
                    navigateTo: const AllPodcastsScreen(),
                    title: 'البودكاست',
                    imagePath: ImageData.podcast,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
