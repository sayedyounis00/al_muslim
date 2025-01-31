import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/core/widgets/custom_title_card.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/radio/data/model/radio_model.dart';
import 'package:al_muslim/features/radio/data/radio_services.dart';
import 'package:al_muslim/features/radio/views/radio_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AllRadioViewBody extends StatefulWidget {
  const AllRadioViewBody({super.key});

  @override
  State<AllRadioViewBody> createState() => _AllRadioViewBodyState();
}

class _AllRadioViewBodyState extends State<AllRadioViewBody> {
  final searchController = TextEditingController();
  List<dynamic> searchedList = [];
  late List<dynamic> allList;
  late Future<List<RadioModel>> future;
  @override
  void initState() {
    future = RadioServices().getRadioData();
    super.initState();
  }

  Widget buildTextFeild() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (searcherChar) {
          addSearcherChartoFiltertheList(searcherChar);
        },
        controller: searchController,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintTextDirection: TextDirection.rtl,
          hintText: 'ابحث عن الاذاعه التي ترغب ف الاستماع اليها',
          hintStyle:
              Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 16),
          suffixIcon: const Icon(Icons.search),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(
          header: 'الاذاعه',
          desc: 'يمكنك الاستماع الي اذاعه القران الكريم لعدد كبير من القراء',
        ),
        buildTextFeild(),
        FutureBuilder(
            future: future,
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                allList = snapShot.data!;
                return HandelRadioList(
                    searchController: searchController,
                    allList: allList,
                    searchedList: searchedList);
              } else if (snapShot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  children: [
                    const SpaceV(250),
                    const Text('🛜',
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center),
                    Text(
                      'تأكد من اتصالك بالإنترنت',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                );
              }
            }),
      ],
    );
  }

  //?search function
  void addSearcherChartoFiltertheList(String searcherChar) {
    searchedList = allList
        .where((radio) => radio.name.toLowerCase().contains(searcherChar))
        .toList();
    setState(() {});
  }
}

class HandelRadioList extends StatelessWidget {
  const HandelRadioList({
    super.key,
    required this.searchController,
    required this.allList,
    required this.searchedList,
  });

  final TextEditingController searchController;
  final List allList;
  final List searchedList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: searchController.text.isEmpty
            ? allList.length
            : searchedList.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomTitleCard(
            prefixIcon: Icons.radio,
            title: searchController.text.isEmpty
                ? allList[index].name
                : searchedList[index].name,
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: RadioView(
                    url: searchController.text.isEmpty
                        ? allList[index].url
                        : searchedList[index].url ?? '',
                    sura: '',
                    reacterName: searchController.text.isEmpty
                        ? allList[index].name
                        : searchedList[index].name,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
