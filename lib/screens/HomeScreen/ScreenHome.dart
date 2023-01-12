import 'dart:async';

import 'package:flutter/material.dart';
import 'package:do_state/screens/NavigationDrawer/navigationDrawer.dart';
import 'package:do_state/screens/Notification/notification.dart';
import 'package:do_state/screens/SearchScreen/SearchHome.dart';

import '../../function/themeColor.dart';
import 'widget/bottomNav.dart';
import 'widget/eventTab.dart';
import 'widget/taskTab.dart';

DateTime timeNow = DateTime.now();
DateTime afterNow = DateTime(
  timeNow.year,
  timeNow.month,
  timeNow.day - 1,
);

class ScreenHome extends StatefulWidget {
  ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      // setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(minutes: 1), (timer) {
      DateTime temptime = DateTime.now();
      // print('inside periodic');
      // print(DateTime(temptime.year, temptime.month, temptime.day,
      //     temptime.hour, temptime.minute));
      // print(DateTime(
      //     notifiationTIme.year,
      //     notifiationTIme.month,
      //     notifiationTIme.day,
      //     notifiationTIme.hour,
      //     notifiationTIme.minute));
      if (DateTime(temptime.year, temptime.month, temptime.day, temptime.hour,
              temptime.minute) ==
          DateTime(
              notifiationTIme.year,
              notifiationTIme.month,
              notifiationTIme.day,
              notifiationTIme.hour,
              notifiationTIme.minute)) {
        initialAwesome(
            globNotifiData!.description, globNotifiData!.location, context);
        print('out periodic');
      }
    });

    return Scaffold(
      drawer: NavigationDrawer(),
      backgroundColor: cBlack,
      appBar: AppBar(
        toolbarHeight: 45,
        backgroundColor: cBlack,
        elevation: 0,
        leading: Builder(builder: (BuildContext context) {
          return InkWell(
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text('DO.',
                  style: TextStyle(
                      height: 2,
                      color: accentYellow,
                      fontFamily: 'comic',
                      fontSize: 27,
                      fontWeight: FontWeight.bold)),
            ),
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SearchHome()));
              },
              icon: const Icon(Icons.search)),
        ],
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 1,
          controller: controller,
          // ignore: prefer_const_literals_to_create_immutables
          tabs: [
            const Tab(
              iconMargin: EdgeInsets.all(0),
              child: Text(
                'Tasks',
                style: TextStyle(
                    height: 3,
                    // color: Colors.white,
                    fontFamily: 'comic',
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Tab(
              child: Text(
                'Events',
                style: TextStyle(
                    // color: Colors.white,
                    height: 3,
                    fontFamily: 'comic',
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
          // indicator:Color,
          indicatorColor: rWhite,
        ),
      ),
      body: Column(children: [
        Expanded(
          child: TabBarView(controller: controller, children: [
            TaskTab(
              homeIndex: controller.index,
            ),
            EventTab(
              homeIndex: controller.index,
            ),
          ]),
        ),
      ]),
      bottomNavigationBar: BottomNav(
        homeIndex: controller.index,
      ),
    );
  }
}
