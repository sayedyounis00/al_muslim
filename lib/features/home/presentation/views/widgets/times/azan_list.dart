import 'package:al_muslim/core/helper/time_helper.dart';
import 'package:al_muslim/features/home/data/model/azan_model.dart';
import 'package:al_muslim/features/home/presentation/view%20model/azan_services.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/times/salah_column.dart';
import 'package:flutter/material.dart';

class AzanList extends StatelessWidget {
  const AzanList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TimeHelper().getRemaindSalahinfo(),
      builder: (context, salahNowSnap) => FutureBuilder<AzanModel>(
        future: PrayTimeServices().getDataFromDB(),
        builder: (context, snapShot) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              handleSalah(snapShot, 0, salahNowSnap)!,
              handleSalah(snapShot, 1, salahNowSnap)!,
              handleSalah(snapShot, 2, salahNowSnap)!,
              handleSalah(snapShot, 3, salahNowSnap)!,
              handleSalah(snapShot, 4, salahNowSnap)!,
            ],
          );
        },
      ),
    );
  }

  Widget? handleSalah(AsyncSnapshot<AzanModel> snapShot, int index,
      AsyncSnapshot<Map<String, String>> salahNowSnap) {
    if (snapShot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapShot.hasData) {
      return returnedSalahColumn(snapShot, index, salahNowSnap);
    } else {
      return const Text('اعد تحميل الصفحة الحالية');
    }
  }

  SalahColumn returnedSalahColumn(AsyncSnapshot<AzanModel> snapShot, int index,
      AsyncSnapshot<Map<String, String>> salahNowSnap) {
    AzanModel prayTime = snapShot.data!;
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
