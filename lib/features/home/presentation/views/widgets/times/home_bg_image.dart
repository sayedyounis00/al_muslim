import 'package:al_muslim/core/helper/lang_converter.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/times/azan_list.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/times/clock.dart';
import 'package:al_muslim/features/salah/data/model/day_data.dart';
import 'package:al_muslim/features/salah/presentation/view%20model/salah_services.dart';
import 'package:al_muslim/features/settings/presentation/view/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomeBgImage extends StatelessWidget {
  const HomeBgImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40),
      height: MediaQuery.of(context).size.height * .39,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SpaceV(5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 50,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: const SettingView(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.settings, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 100,
                width: 100,
                child: ClockView(),
              ),
              const SpaceH(50),
            ],
          ),
          const SpaceV(5),
          const HijriDate(),
          const SpaceV(5),
          const AzanList(),
        ],
      ),
    );
  }
}

class HijriDate extends StatelessWidget {
  const HijriDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SalahServices().getDayDataFormLDB(),
        builder: (context, snapShot) {
          return handelDate(snapShot, context);
        });
  }

  Widget handelDate(AsyncSnapshot<DayData> snapShot, BuildContext context) {
    if (snapShot.hasData) {
      DayData date = snapShot.data!;
      String month = date.date.monthHName;
      String dayInAr =
          LangConverter().convertToArabic(int.parse(date.date.dayHnum));
      String yearInAr =
          LangConverter().convertToArabic(int.parse(date.date.hijriYear));
      return Text(
        '$dayInAr $month $yearInAr',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white,
            ),
      );
    } else if (snapShot.hasError) {
      return const Text('التاريخ غير متوفر ');
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
