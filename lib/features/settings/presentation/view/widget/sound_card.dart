import 'package:al_muslim/core/notification/noti_service.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SoundCard extends StatelessWidget {
  const SoundCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SoundSwitch(),
              const Spacer(),
              Text(
                'صوت الأذان',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 18, color: Colors.black),
              ),
              const SpaceH(10),
              const Icon(Icons.volume_up, color: Colors.black),
              const SpaceH(5),
            ],
          ),
        ),
      ),
    );
  }
}

class SoundSwitch extends StatefulWidget {
  const SoundSwitch({
    super.key,
  });

  @override
  State<SoundSwitch> createState() => _SoundSwitchState();
}

class _SoundSwitchState extends State<SoundSwitch> {
  bool isDone = false;
  @override
  void initState() {
    super.initState();
    sound();
  }

  void sound() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isDone = pref.getBool('sound') ?? false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: Colors.orange,
      value: isDone,
      onChanged: (needSound) async {
        SharedPreferences asyncPref = await SharedPreferences.getInstance();
        asyncPref.setBool('sound', needSound);
        await NotificationService.removeChannel();
        await NotificationService.initNotification();
        await NotificationService.createPrayerNotifications();
        isDone = needSound;
        setState(() {});
      },
    );
  }
}
