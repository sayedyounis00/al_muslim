import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/core/widgets/custom_title_card.dart';
import 'package:al_muslim/features/alquran/views/all_swar.dart';
import 'package:al_muslim/features/alquran/views/listen%20to%20quran/listen_quran_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            header: 'القرآن الكريم',
            desc: 'هنا ستجد كل ما يخص القرآن الكريم',
          ),
          CustomTitleCard(
            title: 'قراءة القران الكريم',
            prefixIcon: Icons.book,
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: const AllSwarView(
                      pageRoute: 'readQuran',
                      reacterName: '',
                    )),
              );
            },
          ),
          CustomTitleCard(
            title: 'استماع القران الكريم',
            prefixIcon: Icons.headphones_outlined,
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: const ListenQuranView()),
              );
            },
          ),
          CustomTitleCard(
            title: 'تفسير القران الكريم',
            prefixIcon: Icons.menu_book,
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: const AllSwarView(
                    reacterName: '',
                    pageRoute: 'redingTafser',
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
