import 'package:al_muslim/features/home/data/model/azan_model.dart';
import 'package:al_muslim/features/home/presentation/view%20model/azan_services.dart';
import 'package:al_muslim/features/salah/data/model/day_data.dart';
import 'package:al_muslim/features/salah/presentation/view%20model/salah_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'salah_state.dart';

AzanModel? azanGlobal;

class SalahCubit extends Cubit<SalahState> {
  SalahCubit() : super(SalahInitial());

  Future<void> setPrayerTime() async {
    azanGlobal = await PrayTimeServices().getDataFromDB();
  }

  Future<void> getDayData() async {
    emit(SalahDataLoaging());
    try {
      DayData dayData = await SalahServices().getDayDataFormLDB();
      emit(SalahDataSuccess(dayData));
    } catch (e) {
      emit(SalahDataFailuer());
    }
  }
}
