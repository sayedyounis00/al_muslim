import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/alquran/views/readQuran/views/quran_images_view.dart';
import 'package:al_muslim/features/alquran/views/readQuran/views/widgets/ayah.dart';
import 'package:al_muslim/features/alquran/views/readQuran/views/widgets/basmallah.dart';
import 'package:al_muslim/features/alquran/views/readQuran/views/widgets/header_widget.dart';
import 'package:al_muslim/features/alquran/views/readQuran/views/widgets/sura_info_butt.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quran/quran.dart' as quran;
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReadQuranView extends StatefulWidget {
  final int requiredPage;

  const ReadQuranView({
    super.key,
    required this.requiredPage,
  });

  @override
  State<ReadQuranView> createState() => _ReadQuranViewState();
}

class _ReadQuranViewState extends State<ReadQuranView> {
  late PageController pageContorller;
  late ItemScrollController scrollController;
  late PageStorageBucket bucket;
  bool imageMode = false;

  @override
  void initState() {
    loadReadMode();
    scrollController = ItemScrollController();
    pageContorller = PageController(initialPage: widget.requiredPage - 1);
    bucket = PageStorageBucket();
    super.initState();
  }

  void loadReadMode() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (await InternetConnectionChecker().hasConnection) {
      imageMode = pref.getBool('read_mode') ?? false;
    } else {
      imageMode = false;
    }
    setState(() {});
  }

  @override
  void dispose() {
    pageContorller.dispose();
    super.dispose();
  }

  void getLastAyah(int suraIndex) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey('last_sura_num')) {
      if (pref.getInt('last_sura_num') == suraIndex) {
        int lastAyahNum = pref.getInt('last_aya_num') ?? 0;
        scrollController.scrollTo(
          index: lastAyahNum,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      }
    }
    scrollController = ItemScrollController();
  
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          const SpaceV(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 20),
                child: IconButton(
                    onPressed: () async {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      imageMode = !imageMode;
                      setState(() {});
                      pref.setBool('read_mode', imageMode);
                    },
                    color: Theme.of(context).textTheme.labelLarge!.color,
                    icon: Icon(!imageMode
                        ? Icons.menu_book_sharp
                        : Icons.notes_rounded)),
              ),
              SuraInfoButton(suraNum: pageContorller.initialPage + 1),
              Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 20),
                child: IconBack(
                  col: Theme.of(context).textTheme.labelLarge!.color!,
                ),
              ),
            ],
          ),
          imageMode
              ? Expanded(
                  child: QuranImagesScreen(
                      pageNumber: quran.getPageNumber(
                          pageContorller.initialPage + 1, 1)),
                )
              : Expanded(
                  child: PageStorage(
                    bucket: bucket,
                    child: PageView.builder(
                        reverse: true,
                        controller: pageContorller,
                        itemBuilder: (context, surahIndex) {
                          getLastAyah(surahIndex);
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                // اسم السوره
                                HeaderWidget(
                                  pageIndex: surahIndex,
                                ),
                                // بسم الله ماعدا سورة التوبه والفاتحة
                                surahIndex == 0 || surahIndex == 8
                                    ? const SizedBox()
                                    : Basmalah(screenSize: screenSize),

                                // الايات
                                Expanded(
                                  child: ScrollablePositionedList.separated(
                                    key: PageStorageKey('surah_$surahIndex'),
                                    itemScrollController: scrollController,
                                    padding: EdgeInsets.zero,
                                    separatorBuilder: (context, index) =>
                                        const Divider(),
                                    itemCount:
                                        quran.getVerseCount(surahIndex + 1),
                                    itemBuilder:
                                        (BuildContext context, int verseIndex) {
                                      return Ayah(
                                        surahIndex: surahIndex,
                                        verseIndex: verseIndex,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
        ],
      ),
    );
  }
}
