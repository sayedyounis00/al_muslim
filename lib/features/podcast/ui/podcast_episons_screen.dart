import 'package:al_muslim/core/utils/models/podcast_data.dart';
import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'video_player_screen.dart';

class PodcastEpisonsScreen extends StatelessWidget {
  final List<PodcastData> podcastData;
  final int index;
  final String podcastImages;
  const PodcastEpisonsScreen({
    super.key,
    required this.podcastData,
    required this.podcastImages,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(header: index == 0 ? 'إيه المشكلة!' : 'وعي', desc: ''),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: podcastData.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      PageTransition(
                          child: VideoPlayerScreen(
                            podcastData: podcastData[index],
                          ),
                          type: PageTransitionType.rightToLeft),
                    ),
                    child: SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        fontSize: 19,
                                      ),
                                  textAlign: TextAlign.center,
                                  podcastData[index].vidTitle)),
                          Image.asset(
                            podcastImages,
                            width: 50,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
