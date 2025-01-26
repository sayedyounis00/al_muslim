import 'package:al_muslim/features/settings/presentation/view%20model/cubit/setting_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());
  bool isRefreshed = true;
  ThemeMode myTheme = ThemeMode.light;
  double myFont = 20.0;

  void setTheme({required ThemeMode theme}) async {
    SharedPreferences asyncPref = await SharedPreferences.getInstance();
    asyncPref.setString('theme', theme.toString());
    myTheme = theme;
    initialDataFromLDB();
  }

  void setFont({required double font}) async {
    SharedPreferences asyncPref = await SharedPreferences.getInstance();
    asyncPref.setDouble('font', font);
    myFont = font;
    initialDataFromLDB();
  }

// Get data
  void initialDataFromLDB() async {
    SharedPreferences asyncPref = await SharedPreferences.getInstance();
    if (asyncPref.getDouble('font') != null) {
      myFont = asyncPref.getDouble('font')!;
    }
    if (asyncPref.getString('theme') == 'ThemeMode.dark') {
      myTheme = ThemeMode.dark;
    } else if (asyncPref.getString('theme') == 'ThemeMode.light') {
      myTheme = ThemeMode.light;
    } else if (asyncPref.getString('theme') == 'ThemeMode.system') {
      myTheme = ThemeMode.system;
    }
    emit(DoneLoadData());
  }
}
