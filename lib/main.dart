import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:do_state/db/model/dataModel.dart';
import 'package:do_state/db/model/eventDataModel.dart';
import 'package:do_state/function/taskSingle.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:do_state/screens/ScreenSplash/screenSplash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  List<DateTime> dateArray;
  TaskSingle task1 =
      TaskSingle('id', 'description', 'date', 'time', 'location', false, false);
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(TaskModelAdapter().typeId)) {
    Hive.registerAdapter(TaskModelAdapter());
  }
  if (!Hive.isAdapterRegistered(EventModelAdapter().typeId)) {
    Hive.registerAdapter(EventModelAdapter());
  }

  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelGroupKey: 'channel_group_key',
        channelKey: 'channel_key',
        channelName: 'channel_name',
        channelDescription: 'channel_description',
        importance: NotificationImportance.Max,
      )
    ],
    debug: true,
  );

  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications(
        permissions: [
          NotificationPermission.Alert,
          NotificationPermission.Sound,
          NotificationPermission.Badge,
          NotificationPermission.Vibration,
          NotificationPermission.Light,
          NotificationPermission.FullScreenIntent,
        ],
      );
    }
  });

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Color.fromARGB(255, 255, 255, 255),
      ),
      home: ScreenSplash(),
      supportedLocales: [Locale('en', 'US')],
    );
  }
}
