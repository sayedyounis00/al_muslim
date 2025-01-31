import 'package:al_muslim/core/utils/images_data.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/alquran/views/readQuran/views/read_quran_view.dart';
import 'package:al_muslim/features/favorites/presentation/view%20model/cubit/fav_cubit.dart';
import 'package:al_muslim/features/favorites/presentation/view%20model/cubit/fav_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quran/quran.dart' as quran;

class LastReadCard extends StatelessWidget {
  const LastReadCard({super.key});

  Future<Map<int, int>?> loadLastData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? suraNum = pref.getInt('last_sura_num');
    int? ayaNum = pref.getInt('last_aya_num');
    if (suraNum != null && ayaNum != null) {
      return {suraNum: ayaNum};
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        if (state is QuranReloadState) {
          return FutureBuilder(
            future: loadLastData(),
            builder: (context, s) {
              if (s.hasData) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: InkWell(
                    onTap: () async {
                      if (s.data != null) {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: ReadQuranView(
                              requiredPage: (s.data!.keys.first) + 1,
                            ),
                          ),
                        );
                      }
                    },
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImageData.allahAkbar,
                              width: 80,
                              height: MediaQuery.of(context).size.width / 5.6,
                            ),
                            const SpaceH(20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text('القراءة من حيث توقفت',
                                    style: TextStyle(fontSize: 22)),
                                Text(
                                  s.data == null
                                      ? 'لم تحدد اخر سورة لك'
                                      : 'توقفت عند سورة ${quran.getSurahNameArabic((s.data!.keys.first) + 1)}',
                                  style: const TextStyle(fontSize: 18),
                                ),
                                Text(
                                  s.data == null
                                      ? 'لم تحدد اخر اية لك'
                                      : 'اية رقم ${(s.data!.values.first) + 1}',
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else if (s.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(color: Colors.orange));
              } else {
                return const SizedBox();
              }
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
