import 'package:flutter/foundation.dart';

// Notification helper packages
// flutter_local_notifications - to send local notification
// timezone - to create time object based on user's timezone
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tzData;
import 'package:timezone/timezone.dart' as tz;

class LocalNoticeService {
  // Singleton of the LocalNoticeService
  static final LocalNoticeService _notificationService =
      LocalNoticeService._internal();

  // Initializing the local notification plugin
  final _localNotificationsPlugin = FlutterLocalNotificationsPlugin();

  factory LocalNoticeService() {
    return _notificationService;
  }

  LocalNoticeService._internal();

  // Initializing the plugin for various platforms
  Future<void> setup() async {
    // Platform-specific notification settings for Android
    const androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');

    // Platform-specific setting
    const initSettings =
        InitializationSettings(android: androidSetting);

    // Initializing the notification plugin with the general setting
    await _localNotificationsPlugin.initialize(initSettings).then((_) {
      debugPrint('setupPlugin: setup success');
    }).catchError((Object error) {
      debugPrint('Error: $error');
    });
  }

  Future<void> addNotification(
    String title,
    String body,
    int endTime, {
    String sound = '',
    String channel = 'default',
  }) async {
    // Timezone data & time for notification
    tzData.initializeTimeZones();
    final scheduleTime =
        tz.TZDateTime.fromMillisecondsSinceEpoch(tz.local, endTime);

    // Detail for android notification
    var soundFile = sound.replaceAll('.mp3', '');

    // Sound file is fetched from the raw folder.
    // You can also pick it from the assets folder and change code accordingly
    final notificationSound =
    sound == '' ? null : RawResourceAndroidNotificationSound(soundFile);

    final androidDetail = AndroidNotificationDetails(
        channel,
        channel,
        playSound: true,
        sound: notificationSound);

    final noticeDetail = NotificationDetails(
      android: androidDetail,
    );

    // Notification ID - used when we want to cancel a particular notif
    const id = 0;

    // Scheduling notification based on user timezone
    await _localNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduleTime,
      noticeDetail,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }

  void cancelAllNotification() {
    _localNotificationsPlugin.cancelAll();

    // To cancel a particular notification
    // _localNotificationsPlugin.cancel(notificationId);
  }
}
