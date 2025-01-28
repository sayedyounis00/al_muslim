import 'package:al_muslim/features/home/data/model/azan_model.dart';
import 'package:al_muslim/features/home/data/model/timing.dart';
import 'package:al_muslim/features/salah/data/model/day_data.dart';
import 'package:al_muslim/features/salah/presentation/view%20model/salah_services.dart';
import 'package:flutter/material.dart';

class PrayTimeServices {
  Future<AzanModel> getDataFromDB() async {
    DayData dayData = await SalahServices().getDayDataFormLDB();
    AzanModel azan = AzanModel(
      timings: Timings(
        fajr: dayData.salah.fajr,
        dhuhr: dayData.salah.dhuhr,
        asr: dayData.salah.asr,
        maghrib: dayData.salah.maghrib,
        isha: dayData.salah.isha,
      ),
      prayTime: '',
      title: '',
      icon: Icons.reddit,
    );
    return azan;
  }
}
