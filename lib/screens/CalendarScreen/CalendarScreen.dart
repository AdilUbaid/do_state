import 'package:flutter/material.dart';
import 'package:do_state/screens/CalendarScreen/widget/calenderTask.dart';
import '../SearchScreen/SearchHome.dart';
import 'widget/Calendar.dart';
import '../../../function/themeColor.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: cBlack,
        backgroundColor: Colors.grey,
        appBar: AppBar(
          foregroundColor: cGreen,
          backgroundColor: cBlack,
          elevation: 0,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SearchHome()));
                },
                icon: const Icon(Icons.search)),
          ],
        ),
        body: Column(
          children: [
             Calendar(),
            // ignore: prefer_const_constructors
            CalenderTask(),
          ],
        ));
  }
}
