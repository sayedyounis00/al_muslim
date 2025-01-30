import 'package:al_muslim/features/salah/presentation/view%20model/cubit/salah_cubit.dart';
import 'package:intl/intl.dart';

class TimeHelper {
  static Map prayTimes = {};

  static String time12({required String time, bool needAmBm = true}) {
    if (needAmBm) {
      DateTime timesss = DateFormat("HH:mm").parse(time);
      String time12 = DateFormat("hh:mm a").format(timesss);
      String time12Arabic = time12.replaceAll("AM", "ص").replaceAll("PM", "م");
      return time12Arabic;
    } else {
      DateTime timesss = DateFormat("HH:mm").parse(time);
      String time12 = DateFormat("hh:mm").format(timesss);
      return time12;
    }
  }

  DateTime parsePrayerTime(String time) {
    final now = DateTime.now();
    final format = DateFormat.Hm(); // 'HH:mm'
    final dateTime = format.parse(time);

    return DateTime(
        now.year, now.month, now.day, dateTime.hour, dateTime.minute);
  }

  Future<Map<String, String>> getRemaindSalahinfo() async {
    DateTime now = DateTime.now();

    var azan = azanGlobal;

    if (azan == null) {
      return {'': '00:00:00'};
    }

    prayTimes = {
      'الفجر': azan.timings.fajr,
      'الظهر': azan.timings.dhuhr,
      'العصر': azan.timings.asr,
      'المغرب': azan.timings.maghrib,
      'العشاء': azan.timings.isha,
    };

    for (var pray in prayTimes.entries) {
      DateTime prayerDateTime = parsePrayerTime(pray.value);

      if (prayerDateTime.isAfter(now)) {
        String nextSalahName = pray.key;
        String remaind = prayerDateTime.difference(now).abs().toString();
        final hour = remaind.split(':')[0].padLeft(2, '0');
        final min = remaind.split(':')[1].padLeft(2, '0');
        String salahAfter =
            '$hour:$min:${((60 - now.second).abs()).toString().padLeft(2, '0')}';

        return {nextSalahName: salahAfter};
      }
    }
    if (true) {
      DateTime fajrDateTime = parsePrayerTime(azan.timings.fajr);
      String remaind = fajrDateTime
          .add(const Duration(days: 1))
          .difference(now)
          .abs()
          .toString();
      final hour = remaind.split(':')[0].padLeft(2, '0');
      final min = remaind.split(':')[1].padLeft(2, '0');
      String salahfajrAfter =
          '$hour:$min:${((60 - now.second).abs()).toString().padLeft(2, '0')}';

      return {'الفجر': salahfajrAfter};
    }
  }
}
