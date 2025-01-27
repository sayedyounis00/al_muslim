import 'package:al_muslim/core/helper/location.dart';
import 'package:al_muslim/core/storage/storage_service.dart';
import 'package:al_muslim/features/home/data/model/azan_model.dart';
import 'package:intl/intl.dart';

class PrayTimeServices {
  
  
  Future<void> getPrayTime() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    String loc = await FinalLoc.getLoc();

    StorageService.setToLDB(
      keyInLDB: 'pray_times',
      apiLink:
          'https://api.aladhan.com/v1/timingsByCity/$formattedDate?city=$loc&country=',
    );
  }

  Future<AzanModel> getDataFromDB() async {
    dynamic prayMap = await StorageService.getFromLDB(key: 'pray_times');
    AzanModel azan = AzanModel.fromJson(prayMap);
    return azan;
  }
}
