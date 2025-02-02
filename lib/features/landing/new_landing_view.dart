import 'dart:developer';

import 'package:al_muslim/core/helper/location.dart';
import 'package:al_muslim/core/storage/local_storage_service.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/home/presentation/views/home_view.dart';
import 'package:al_muslim/features/landing/widgets/landing_list_tile.dart';
import 'package:al_muslim/features/salah/presentation/view%20model/salah_services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:workmanager/workmanager.dart';

class NewLandingView extends StatefulWidget {
  const NewLandingView({super.key});

  @override
  State<NewLandingView> createState() => _NewLandingViewState();
}

class _NewLandingViewState extends State<NewLandingView> {
  bool hasPermission = false;
  bool hasLocation = false;
  bool downloading = false;

  void mm() async {
    hasLocation = await Geolocator.isLocationServiceEnabled();
    setState(() {});
    Permission.location.request().then((val) {
      hasPermission = (val == PermissionStatus.granted);
    });
  }

  @override
  Widget build(BuildContext context) {
    mm();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo/brand.png',
            height: 60,
            width: 220,
            color: Colors.orange,
          ),
          const SpaceV(40),
          Image.asset('assets/images/landing_masged.png', height: 360),
          const SpaceV(20),
          LandingListTile(
            buttonChild:
                hasLocation ? const Text('تم التفعيل ') : const Text('تفعيل'),
            title: 'يجب تفعيل الموقع للاستمرار ف تسجيل الدخول',
            onPressed: () async {
              await Location().openLocationSettings();
              setState(() {});
            },
          ),
          ElevatedButton(
            onPressed: () async {
              if (hasLocation && hasPermission == true) {
                downloading = true;
                setState(() {});
                try {
                  await SalahServices().setDayData();
                  pref.setBool('hasSeenLandingPage', true);
                  Workmanager().registerPeriodicTask(
                    'azan',
                    'azanTask',
                    frequency: const Duration(hours: 6),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),
                    ),
                  );
                } catch (e) {
                  log(e.toString());
                  downloading = false;
                }
              }
            },
            child: downloading
                ? const SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('دخول'),
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    downloading = false;
    super.dispose();
  }
}
