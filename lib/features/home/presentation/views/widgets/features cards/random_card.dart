import 'dart:async';
import 'dart:math';
import 'package:al_muslim/core/widgets/isnside_noti.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/circule_acion_button.dart';
import 'package:flutter/material.dart';

class RandomCard extends StatefulWidget {
  const RandomCard({
    super.key,
  });

  @override
  State<RandomCard> createState() => _RandomCardState();
}

class _RandomCardState extends State<RandomCard> {
  late int ayah;
  Timer? _timer;

  final List<String> ayat = [
    'رَبِّ أَدخِلني مُدخَلَ صِدقٍ وَأَخرِجني مُخرَجَ صِدقٍ وَاجعَل لي مِن لَدُنكَ سُلطانًا نَصيرًا',
    'رَّبِّ أَنزِلْنِي مُنزَلًا مُّبَارَكًا وَأَنتَ خَيْرُ الْمُنزِلِينَ',
    'اللَّهمَّ إنَّكَ عفوٌّ تحبُّ العفوَ فاعفُ عنِّي',
    'رَبَّنَا لَا تُزِغْ قُلُوبَنَا بَعْدَ إِذْ هَدَيْتَنَا وَهَبْ لَنَا مِن لَدُنكَ رَحْمَةً إِنَّكَ أَنْتَ الْوَهَّابُ',
    'رَبِّ زِدْنِي عِلْمًا',
    'رَبَّنَا أَفْرِغْ عَلَيْنَا صَبْرًا وَتَوَفَّنَا مُسْلِمِينَ',
    'رَبِّ اشْرَحْ لِي صَدْرِي وَيَسِّرْ لِي أَمْرِي وَاحْلُلْ عُقْدَةً مِّن لِّسَانِي يَفْقَهُوا قَوْلِي',
    'رَبَّنَا لَا تُؤَاخِذْنَا إِن نَّسِينَا أَوْ أَخْطَأْنَا رَبَّنَا وَلَا تَحْمِلْ عَلَيْنَا إِصْرًا كَمَا حَمَلْتَهُ عَلَى الَّذِينَ مِن قَبْلِنَا',
    'رَبِّ اجْعَلْنِي مُقِيمَ الصَّلَاةِ وَمِن ذُرِّيَّتِي رَبَّنَا وَتَقَبَّلْ دُعَاءِ',
    'رَبِّ هَبْ لِي مِن لَّدُنكَ ذُرِّيَّةً طَيِّبَةً إِنَّكَ سَمِيعُ الدُّعَاءِ',
    'رَبَّنَا اغْفِرْ لَنَا ذُنُوبَنَا وَكَفِّرْ عَنَّا سَيِّئَاتِنَا وَتَوَفَّنَا مَعَ الأبْرَارِ',
    'رَبِّ هَبْ لِي حُكْمًا وَأَلْحِقْنِي بِالصَّالِحِينَ',
    'رَبَّنَا ظَلَمْنَا أَنفُسَنَا وَإِن لَمْ تَغْفِرْ لَنَا وَتَرْحَمْنَا لَنَكُونَنَّ مِنَ الْخَاسِرِينَ',
    'رَبِّ أَعُوذُ بِكَ مِنْ هَمَزَاتِ الشَّيَاطِينِ وَأَعُوذُ بِكَ رَبِّ أَنْ يَحْضُرُونِ',
    'رَبِّ أَدْخِلْنِي مُدْخَلَ صِدْقٍ وَأَخْرِجْنِي مُخْرَجَ صِدْقٍ وَاجْعَلْ لِي مِنْ لَدُنْكَ سُلْطَانًا نَصِيرًا',
    'رَبَّنَا آتِنَا مِنْ لَدُنْكَ رَحْمَةً وَهَيِّئْ لَنَا مِنْ أَمْرِنَا رَشَدًا',
    'رَبَّنَا اصْرِفْ عَنَّا عَذَابَ جَهَنَّمَ إِنَّ عَذَابَهَا كَانَ غَرَامًا',
    'رَبِّ إِنِّي مَغْلُوبٌ فَانْتَصِرْ',
  ];

  @override
  void initState() {
    super.initState();
    ayah = Random().nextInt(ayat.length);
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 30), (timer) {
      setState(() {
        ayah = Random().nextInt(ayat.length);
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      height: MediaQuery.of(context).size.height * .20,
      child: Card(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CirculeActionButton(
                    color: const Color.fromARGB(255, 70, 129, 154),
                    icon: Icons.replay,
                    radius: 20,
                    onTap: () {
                      ayah = Random().nextInt(ayat.length);
                      setState(() {});
                    },
                  ),
                ),
                Text(
                  'رسالتك اليوميه',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CirculeActionButton(
                    onTap: () async {
                      InsideNotification.takeScreenshotAndShare(
                        zkr: ayat[ayah],
                      );
                    },
                    color: Colors.orange,
                    icon: Icons.share,
                    radius: 20,
                  ),
                ),
              ],
            ),
            const SpaceV(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                textAlign: TextAlign.center,
                ayat[ayah],
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
