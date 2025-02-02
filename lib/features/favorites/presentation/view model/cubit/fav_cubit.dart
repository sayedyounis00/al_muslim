import 'dart:convert';
import 'package:al_muslim/core/storage/local_storage_service.dart';
import 'package:al_muslim/features/athkar/data/models/zkr_item.dart';
import 'package:al_muslim/features/favorites/presentation/view%20model/cubit/fav_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());
  static List<ZkrItem> allFavList = [];

  void addToFav(ZkrItem zkr) {
    allFavList.add(zkr);
    setFavToLDB();
  }

  void removeFromFav(ZkrItem zkr) {
    allFavList.removeWhere(
      (element) {
        if (element.text == zkr.text) {
          return true;
        } else {
          return false;
        }
      },
    );
    setFavToLDB();
    emit(RemoveFav());
  }

  Future<void> setFavToLDB() async {
    // final prefs = await SharedPreferences.getInstance();
    var jsonList =
        allFavList.map((zekr) => json.encode(zekr.toJson())).toList();
    pref.setStringList('fav_list', jsonList);
  }

  Future<List<ZkrItem>> getFavFromLDB() async {
    // final prefs = await SharedPreferences.getInstance();
    List<String> jsonList = pref.getStringList('fav_list') ?? [];

    return jsonList.map((jsonString) {
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      return ZkrItem.fromJson(jsonMap);
    }).toList();
  }

  Future<bool> isFound(ZkrItem zkr) async {
    List<ZkrItem> finalFavList = await getFavFromLDB();
    for (var element in finalFavList) {
      if (element.text == zkr.text) {
        emit(FoundState());
        return true;
      }
    }
    return false;
  }

  void quranReloadLastAya() {
    emit(QuranReloadState());
  }
}
