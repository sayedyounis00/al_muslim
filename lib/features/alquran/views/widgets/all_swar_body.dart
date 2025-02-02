import 'package:al_muslim/core/storage/local_storage_service.dart';
import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/core/widgets/isnside_noti.dart';
import 'package:al_muslim/features/alquran/data/fehres_service.dart';
import 'package:al_muslim/features/alquran/data/model/fehres_model.dart';
import 'package:al_muslim/core/widgets/custom_title_card.dart';
import 'package:al_muslim/features/alquran/views/readQuran/views/read_quran_view.dart';
import 'package:al_muslim/features/alquran/views/tafserQuran/views/tafser_view.dart';
import 'package:al_muslim/features/radio/views/radio_view.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AllSwarViewBody extends StatefulWidget {
  final String pageRoute;
  final String? swrahUrl;
  final String reacterName;
  const AllSwarViewBody(
      {super.key,
      required this.pageRoute,
      this.swrahUrl,
      required this.reacterName});

  @override
  State<AllSwarViewBody> createState() => _AllSwarViewBodyState();
}

class _AllSwarViewBodyState extends State<AllSwarViewBody> {
  List<SwarModel> searchedList = [];
  late List<SwarModel> allSwar;

  bool isReadingView() {
    if (widget.pageRoute == 'readQuran') {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          header: 'السور',
          desc: '',
          downloadIcon: Icons.bookmark,
          hasDownload: isReadingView(),
          downloadButt: ()  {
            // final pref = await SharedPreferences.getInstance();
            final lastSuraNum = pref.getInt('last_sura_num');
            if (lastSuraNum != null) {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: ReadQuranView(requiredPage: lastSuraNum + 1),
                ),
              );
            } else {
              InsideNotification.insideNotificationCard(
                contentType: ContentType.failure,
                context: context,
                title: 'لم تحدد اخر موضع لك',
                content: "لتحديد موضعك اضغط مرتان علي اي آيه",
              );
            }
          },
        ),

        // Search
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
          child: TextField(
            onChanged: (searcherChar) {
              searchedList = allSwar
                  .where(
                      (sura) => sura.name.toLowerCase().contains(searcherChar))
                  .toList();
              setState(() {});
            },
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintTextDirection: TextDirection.rtl,
              hintText: 'ابحث عن السورة التي تريدها',
              hintStyle: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontSize: 16),
              suffixIcon: const Icon(Icons.search),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
        ),

        // Suar list view
        Expanded(
          child: FutureBuilder(
              future: FehresService().getSwarList(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  allSwar = snapShot.data!;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: searchedList.isEmpty
                        ? allSwar.length
                        : searchedList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return searchedList.isEmpty
                          ? CustomTitleCard(
                              title: allSwar[index].name,
                              onTap: () {
                                switch (widget.pageRoute) {
                                  case 'redingTafser':
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          child: TafserView(
                                              tafserstartIndex: index + 1)),
                                    );

                                  case 'listenToSwrah':
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: RadioView(
                                          url: manageIndex(index),
                                          sura: allSwar[index].name,
                                          reacterName: widget.reacterName,
                                        ),
                                      ),
                                    );

                                  case 'readQuran':
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: ReadQuranView(
                                            requiredPage: index + 1),
                                      ),
                                    );
                                  default:
                                }
                              },
                            )
                          : CustomTitleCard(
                              title: searchedList[index].name,
                              onTap: () {
                                switch (widget.pageRoute) {
                                  case 'redingTafser':
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          child: TafserView(
                                              tafserstartIndex:
                                                  (searchedList[index].id - 1) +
                                                      1)),
                                    );

                                  case 'listenToSwrah':
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: RadioView(
                                          url: manageIndex(
                                              searchedList[index].id - 1),
                                          sura: allSwar[
                                                  searchedList[index].id - 1]
                                              .name,
                                          reacterName: widget.reacterName,
                                        ),
                                      ),
                                    );

                                  case 'readQuran':
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: ReadQuranView(
                                            requiredPage:
                                                (searchedList[index].id - 1) +
                                                    1),
                                      ),
                                    );
                                  default:
                                }
                              },
                            );
                    },
                  );
                } else {
                  return Center(child: Text(snapShot.error.toString()));
                }
              }),
        )
      ],
    );
  }

  String manageIndex(index) {
    if (index + 1 <= 9) {
      return '${widget.swrahUrl}${'00${index + 1}.mp3'}';
    } else if (index + 1 >= 10 && index + 1 < 100) {
      return '${widget.swrahUrl}${'0${index + 1}.mp3'}';
    } else {
      return '${widget.swrahUrl}${'${index + 1}.mp3'}';
    }
  }
}
