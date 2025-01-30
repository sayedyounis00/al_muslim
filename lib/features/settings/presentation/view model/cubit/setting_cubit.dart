import 'package:al_muslim/core/utils/constants.dart';
import 'package:al_muslim/features/settings/presentation/view%20model/cubit/setting_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());
  bool isRefreshed = true;
  ThemeMode myTheme = ThemeMode.system;
  Color myColor = AppColors.kBgColDark;
  Color conColor = AppColors.kPrimaryColLight;
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

  void setbgColor({required int color}) async {
    SharedPreferences asyncPref = await SharedPreferences.getInstance();
    asyncPref.setInt('bgcolor', color);
    myColor = Color(color);
    initialDataFromLDB();
  }

  void setContainerColor({required int color}) async {
    SharedPreferences asyncPref = await SharedPreferences.getInstance();
    asyncPref.setInt('conColor', color);
    conColor = Color(color);
    initialDataFromLDB();
  }

// Get data
  void initialDataFromLDB() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getDouble('font') != null) {
      myFont = pref.getDouble('font')!;
    }
    if (pref.getString('theme') == 'ThemeMode.dark') {
      myTheme = ThemeMode.dark;
    } else if (pref.getString('theme') == 'ThemeMode.light') {
      myTheme = ThemeMode.light;
    } else if (pref.getString('theme') == 'ThemeMode.system') {
      myTheme = ThemeMode.system;
    }

    if (pref.getInt('bgcolor') != null) {
      myColor = Color(pref.getInt('bgcolor')!);
    }

    if (pref.getInt('conColor') != null) {
      conColor = Color(pref.getInt('conColor')!);
    }
    emit(DoneLoadData());
  }
}
