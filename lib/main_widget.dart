import 'package:al_muslim/core/themes/theme_data.dart';
import 'package:al_muslim/features/home/presentation/view%20model/azan_services.dart';
import 'package:al_muslim/features/home/presentation/views/home_view.dart';
import 'package:al_muslim/features/landing/new_landing_view.dart';
import 'package:al_muslim/features/salah/presentation/view%20model/salah_services.dart';
import 'package:al_muslim/features/settings/presentation/view%20model/cubit/setting_cubit.dart';
import 'package:al_muslim/features/settings/presentation/view%20model/cubit/setting_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    hasSeenLandingPage = prefs.getBool('hasSeenLandingPage') ?? false;
    setState(() {});
  }

  updatePrayDate() async {
    bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected && hasSeenLandingPage) {
      SalahServices().setDayData();
      PrayTimeServices().getPrayTime();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        BlocProvider.of<SettingCubit>(context).initialDataFromLDB();
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'المسلم',
              themeMode: BlocProvider.of<SettingCubit>(context).myTheme,
              darkTheme:
                  CustomThemeData(BlocProvider.of<SettingCubit>(context).myFont)
                      .darkData(context),
              theme:
                  CustomThemeData(BlocProvider.of<SettingCubit>(context).myFont)
                      .lightData(context),
              home: hasSeenLandingPage
                  ? const HomeView()
                  : const NewLandingView(),
            ),
          ),
        );
      },
    );
  }
}
