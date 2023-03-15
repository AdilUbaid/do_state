import 'package:do_state/controller/search_screen/search_bar/search_bar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:do_state/db/model/dataModel.dart';
import 'package:do_state/db/model/eventDataModel.dart';
import 'package:do_state/function/taskSingle.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:do_state/screens/ScreenSplash/screenSplash.dart';

import 'controller/calendar/calendar_bloc.dart';
import 'controller/screen_home/add_image/add_image_bloc.dart';
import 'controller/search_screen/chip/chip_bloc.dart';

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

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChipBloc(),
        ),
        BlocProvider(
          create: (context) => CalendarBloc(),
        ),
        BlocProvider(
          create: (context) => AddImageBloc(),
        ),
        BlocProvider(
          create: (context) => SearchBarBloc(),
        ),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: Color.fromARGB(255, 255, 255, 255),
        ),
        home: ScreenSplash(),
        supportedLocales: [Locale('en', 'US')],
      ),
    );
  }
}
