import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/times/azan_list.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/times/clock.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/times/hijri_date.dart';
import 'package:al_muslim/features/salah/presentation/view%20model/cubit/salah_cubit.dart';
import 'package:al_muslim/features/settings/presentation/view/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class HomeBgImage extends StatelessWidget {
  const HomeBgImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SalahCubit()
        ..setPrayerTime()
        ..getDayData(),
      child: BlocBuilder<SalahCubit, SalahState>(builder: (context, state) {
        if (state is SalahDataSuccess) {
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
                HijriDate(state: state),
                const SpaceV(5),
                const AzanList(),
              ],
            ),
          );
        } else if (state is SalahDataLoaging) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
            ),
          );
        } else {
          return const Center(
              child: Text(
            'حدث خطا في تحميل البيانات',
            style: TextStyle(color: Colors.white),
          ));
        }
      }),
    );
  }
}
