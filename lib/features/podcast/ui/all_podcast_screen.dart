import 'package:al_muslim/core/utils/images_data.dart';
import 'package:al_muslim/core/utils/models/podcast_data.dart';
import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/features/podcast/data/podcasts_links.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'podcast_episons_screen.dart';
import 'widgets/home_main_item.dart';

class AllPodcastsScreen extends StatelessWidget {
  const AllPodcastsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, List<PodcastData>> podcasts = {
      ImageData.podcastEhLmoshkla: ehElmoshkilaVideos(),
      ImageData.podcastWae: wa3iVideos(),
    };

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const CustomAppBar(header: 'البودكاست', desc: ''),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: podcasts.length,
              itemBuilder: (BuildContext context, int index) {
                return PodcastItem(
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                        child: PodcastEpisonsScreen(
                          index: index,
                          podcastData: podcasts.values.toList()[index],
                          podcastImages: podcasts.keys.toList()[index],
                        ),
                        type: PageTransitionType.rightToLeft),
                  ),
                  imageUrl: podcasts.keys.toList()[index],
                  height: 200,
                  width: 110,
                  radius: 20,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
