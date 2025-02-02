import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/features%20cards/features_grid_view.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/features%20cards/last_read_card.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/features%20cards/quran_card.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/features%20cards/random_card.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/features%20cards/routine_track_card.dart';
import 'package:flutter/material.dart';

class BodyContent extends StatelessWidget {
  const BodyContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SpaceV(20),
        LastReadCard(),
        SpaceV(3),
        QuranCard(),
        SpaceV(3),
        FeaturesGridView(),
        SpaceV(3),
        RoutineTrackCard(),
        RandomCard(),
        SpaceV(20),
      ],
    );
  }
}
