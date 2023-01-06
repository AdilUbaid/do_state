import 'package:flutter/material.dart';

import '../../taskView/TaskView.dart';
import '../../../function/themeColor.dart';
import 'calenderTask.dart';

class CalendarEveTask extends StatelessWidget {
  const CalendarEveTask({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items;
    // return ListView.builder(
    // itemCount: tasks.length,
    // prototypeItem: ListTile(
    //   title: Text('k'),
    // ),
    // itemBuilder: (context, index) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => TaskView()));
        },
        child: Container(
          // height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17), color: cGreen),
          child: Container(
              padding: const EdgeInsets.all(17),
              child: Column(
                // ignore: prefer_const_constructors
                children: const [CalenderTask(), 
                // CalenderEvent()
                ],
              )),
        ),
      ),
    );
  }
}

// }
