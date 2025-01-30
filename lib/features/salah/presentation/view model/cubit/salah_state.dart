part of 'salah_cubit.dart';


sealed class SalahState {}

final class SalahInitial extends SalahState {}

final class SalahDataLoaging extends SalahState {}

final class SalahDataSuccess extends SalahState {
  final DayData dayData;

  SalahDataSuccess(this.dayData);
}

final class SalahDataFailuer extends SalahState {}
