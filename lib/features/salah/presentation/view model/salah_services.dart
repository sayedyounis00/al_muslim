import 'package:al_muslim/core/helper/location.dart';
import 'package:al_muslim/core/storage/storage_service.dart';
import 'package:al_muslim/features/salah/data/model/day_data.dart';
import 'package:intl/intl.dart';

class SalahServices {
  Future<void> setDayData() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    String loc = await FinalLoc.getLoc();

    StorageService.setToLDB(
        keyInLDB: 'salah',
        apiLink:
            'https://api.aladhan.com/v1/timingsByCity/$formattedDate?city=$loc&country=');
  }

  Future<DayData> getDayDataFormLDB() async {
    var data = await StorageService.getFromLDB(key: 'salah');

    DayData dayData = DayData.fromJson(data);

    return dayData;
  }
}
