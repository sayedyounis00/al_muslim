import 'package:al_muslim/core/helper/time_helper.dart';
import 'package:al_muslim/features/home/data/model/azan_model.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/times/salah_column.dart';
import 'package:al_muslim/features/salah/presentation/view%20model/cubit/salah_cubit.dart';
import 'package:flutter/material.dart';

class AzanList extends StatelessWidget {
  const AzanList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TimeHelper().getRemaindSalahinfo(),
      builder: (context, salahNowSnap) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            returnedSalahColumn(0, salahNowSnap),
            returnedSalahColumn(1, salahNowSnap),
            returnedSalahColumn(2, salahNowSnap),
            returnedSalahColumn(3, salahNowSnap),
            returnedSalahColumn(4, salahNowSnap),
          ],
        );
      },
    );
  }

  SalahColumn returnedSalahColumn(int index, salahNowSnap) {
    AzanModel prayTime = azanGlobal!;
    final List<AzanModel> azan = [
      AzanModel(
        title: 'الفجر',
        icon: Icons.cloud,
        prayTime: prayTime.timings.fajr,
        timings: prayTime.timings,
      ),
      AzanModel(
          title: 'الظهر',
          icon: Icons.wb_sunny_outlined,
          timings: prayTime.timings,
          prayTime: prayTime.timings.dhuhr),
      AzanModel(
          title: 'العصر',
          icon: Icons.sunny,
          timings: prayTime.timings,
          prayTime: prayTime.timings.asr),
      AzanModel(
          title: 'المغرب',
          icon: Icons.nights_stay_outlined,
          timings: prayTime.timings,
          prayTime: prayTime.timings.maghrib),
      AzanModel(
          title: 'العشاء',
          icon: Icons.nightlight_outlined,
          timings: prayTime.timings,
          prayTime: prayTime.timings.isha),
    ];
    return SalahColumn(
      azan: azan[index],
      iconCol: salahNowSnap.data!.entries.first.key == azan[index].title
          ? Colors.yellow
          : Colors.white,
    );
  }
}
