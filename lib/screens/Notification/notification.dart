import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:do_state/screens/HomeScreen/ScreenHome.dart';
import 'package:do_state/screens/HomeScreen/widget/taskTab.dart';

import '../HomeScreen/widget/addTaskEvent.dart';
import '../previous/widget/pending_view.dart';

Future<void> initialAwesome(
    String title, String body, BuildContext context) async {
  final audioPlayer = AudioPlayer();
  // bool isPlaying = false;
  // final player = AudioCache(prefix: 'assets/');
  // final url = await player.load('mixkit-scanning-sci-fi-alarm-905.wav');
  // audioPlayer.setSourceUrl(url.path);

  AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: DateTime.now().second,
      channelKey: 'channel_key', //Same as above in initilize,
      title: title,
      body: body,
      wakeUpScreen: true,
      fullScreenIntent: true,
      criticalAlert: true,

      //Other parameters
    ),
    actionButtons: <NotificationActionButton>[
      NotificationActionButton(key: 'done', label: 'done', color: Colors.white),
      // NotificationActionButton(key: 'snooze', label: 'snooze'),
      NotificationActionButton(key: 'reschedule', label: 'reschedule'),
    ],
  );
  audioPlayer.play(AssetSource('mixkit-scanning-sci-fi-alarm-905.wav'),
      volume: 100);
  audioPlayer.setVolume(100);
// }

// void checkAwesome()  {
  AwesomeNotifications().actionStream.listen(
    (ReceivedAction receivedAction) {
      if (receivedAction.buttonKeyPressed == 'done') {
        //Your code goes here
        print('accepted accepted accepted accepted ');
        audioPlayer.stop();
        markDone(globNotifiData!, context, 0);
      } else if (receivedAction.buttonKeyPressed == 'reschedule') {
        print('not not not not');
        audioPlayer.stop();
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScreenHome(),
            ));
        {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            context: context,
            builder: (BuildContext context) {
              return AddTaskEvent(
                mode: 'ET',
                homeIndex: 0,
                data: globNotifiData,
              );
            },
          );
        }
        //Your code goes here
      }

      //Here if the user clicks on the notification itself
      //without any button
    },
  );
}
