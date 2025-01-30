import 'dart:async';
import 'dart:developer';
import 'package:al_muslim/features/salah/data/model/day_data.dart';
import 'package:al_muslim/features/salah/presentation/view%20model/salah_services.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationService {
  static bool _needSound = false;

  static Future<void> initNotification() async {
    await AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) async {
        if (!isAllowed) {
          await AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey('sound')) {
      _needSound = pref.getBool('sound') ?? false;
    }
    await AwesomeNotifications().initialize(
      'resource://drawable/noti',
      [
        NotificationChannel(
          channelKey: 'prayer_channel',
          channelName: 'Prayer Notifications',
          channelDescription: 'Notification channel for prayer times',
          defaultColor: const Color(0xFF9D50DD),
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          playSound: _needSound,
          soundSource: 'resource://raw/azan',
        ),
      ],
    );
  }

  static Future<void> createPrayerNotifications() async {
    DayData dayData = await SalahServices().getDayDataFormLDB();
    var fajr = _getMinAndHourFromDateString(dayData.salah.fajr);
    var dhuhr = _getMinAndHourFromDateString(dayData.salah.dhuhr);
    var asr = _getMinAndHourFromDateString(dayData.salah.asr);
    var maghrib = _getMinAndHourFromDateString(dayData.salah.maghrib);
    var isha = _getMinAndHourFromDateString(dayData.salah.isha);

    await _createNotificationGlobal(
        id: 0, salahName: "الفجر", hour: fajr['hour'], minute: fajr['min']);
    await _createNotificationGlobal(
        id: 1, salahName: "الظهر", hour: dhuhr['hour'], minute: dhuhr['min']);
    await _createNotificationGlobal(
        id: 2, salahName: "العصر", hour: asr['hour'], minute: asr['min']);
    await _createNotificationGlobal(
        id: 3,
        salahName: "المغرب",
        hour: maghrib['hour'],
        minute: maghrib['min']);
    await _createNotificationGlobal(
        id: 4, salahName: "العشاء", hour: isha['hour'], minute: isha['min']);
    log((await AwesomeNotifications().listScheduledNotifications()).toString());
  }

  static Future<void> _createNotificationGlobal({
    required String salahName,
    required int id,
    required int hour,
    required int minute,
  }) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'prayer_channel',
        title: 'أذان $salahName',
        body: "يحين الآن موعد أذان $salahName",
        notificationLayout: NotificationLayout.Default,
      ),
      schedule: NotificationCalendar(
        repeats: true, // اتركها كما هي لتكرار الإشعارات يوميًا
        hour: hour,
        minute: minute,
        second: 0,
        millisecond: 0,
        preciseAlarm: true,
      ),
    );
  }

  static Future<void> removeAllNotifications() async {
    await AwesomeNotifications().cancelAll();
  }

  static Future<void> removeChannel() async {
    await AwesomeNotifications().removeChannel('prayer_channel');
  }

  static Map _getMinAndHourFromDateString(String salah) {
    List<String> parts = salah.split(':');
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);

    return {
      'hour': hour,
      'min': minute,
    };
  }
}
