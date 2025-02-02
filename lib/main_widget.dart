import 'package:al_muslim/core/storage/local_storage_service.dart';
import 'package:al_muslim/core/themes/theme_data.dart';
import 'package:al_muslim/features/favorites/presentation/view%20model/cubit/fav_cubit.dart';
import 'package:al_muslim/features/home/presentation/views/home_view.dart';
import 'package:al_muslim/features/landing/new_landing_view.dart';
import 'package:al_muslim/features/salah/presentation/view%20model/salah_services.dart';
import 'package:al_muslim/features/settings/presentation/view%20model/cubit/setting_cubit.dart';
import 'package:al_muslim/features/settings/presentation/view%20model/cubit/setting_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  bool hasSeenLandingPage = true;

  @override
  void initState() {
    super.initState();
    _checkLandingPage();
    updatePrayDate();
  }

  Future<void> _checkLandingPage() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    hasSeenLandingPage = pref.getBool('hasSeenLandingPage') ?? false;
    setState(() {});
  }

  Future<void> updatePrayDate() async {
    bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected && hasSeenLandingPage) {
      SalahServices().setDayData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            child: BlocProvider(
              create: (context) => FavCubit()..quranReloadLastAya(),
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'المسلم',
                themeMode: BlocProvider.of<SettingCubit>(context).myTheme,
                darkTheme: CustomThemeData(
                        BlocProvider.of<SettingCubit>(context).myFont)
                    .darkData(
                  context,
                  context.read<SettingCubit>().myColor,
                  context.read<SettingCubit>().conColor,
                ),
                theme: CustomThemeData(
                        BlocProvider.of<SettingCubit>(context).myFont)
                    .lightData(
                  context,
                  context.read<SettingCubit>().conColor,
                ),
                home: hasSeenLandingPage
                    ? const HomeView()
                    : const NewLandingView(),
              ),
            ),
          ),
        );
      },
    );
  }
}
