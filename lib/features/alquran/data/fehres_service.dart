
import 'package:al_muslim/features/alquran/data/model/fehres_model.dart';
import 'package:quran/quran.dart' as quran;

class FehresService {
  Future getSwarList() async {
    List<SwarModel> swarList = [];
    for (var i = 1; i <= 114; i++) {
      swarList.add(
        SwarModel(
          id: i,
          name: quran.getSurahNameArabic(i),
        ),
      );
    }
    return swarList;
  }
}
