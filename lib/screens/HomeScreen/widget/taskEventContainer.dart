import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:do_state/main.dart';

import '../../../function/themeColor.dart';
import '../../EventsView/eventsVIew.dart';
import '../../taskView/TaskView.dart';
import 'button.dart';

class TaskEventContainer extends StatelessWidget {
  var index;

  var id;

  TaskEventContainer(
      {super.key,
      this.homeIndex = 0,
      required this.data,
      required this.index,
      this.id});
  var homeIndex;
  var data;

  @override
  Widget build(BuildContext context) {
    final List<String> items;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: GestureDetector(
        onTap: () {
          eventRout(homeIndex, context);
        },
        child: Container(
          // height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17), color: cGreen),
          child: Container(
            padding: const EdgeInsets.all(17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const Text(
                    //   // "Today",
                    //   '       ',
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontFamily: 'comic',
                    //       fontSize: 26),
                    // ),
                    Column(
                      children: [
                        Text(
                          DateFormat('dd MMM yyy hh : mm a').format(data.date),
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'comic',
                              color: rBlack,
                              fontSize: 21),
                        ),
                        Text(
                          DateFormat('EEEE').format(data.date),
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'comic',
                              color: rBlack,
                              fontSize: 21),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.description,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'comic',
                              color: rBlack,
                              fontSize: 17,
                            )),
                        Text(
                          data.location,
                          style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontFamily: 'comic',
                              color: rBlack,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    Column(
                      children: [Button(lowHigh: data.priority)],
                    )
                  ],
                ),

                // const Text(
                //   'Task 1',
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontFamily: 'comic',
                //       fontSize: 20),
                // ),
                // const Text(
                //   'Description',
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontFamily: 'comic',
                //       fontSize: 20),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
  // );

  void eventRout(var homeIndex, context) {
    if (homeIndex == 0) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TaskView(
                data: data,
                index: index,
                id: id,
              )));
    } else if (homeIndex == 1) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EventsView(
                data: data,
                index: index,
              )));
    }
  }
}
