import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:do_state/db/funtion/eventDbFunctions.dart';
import 'package:do_state/db/model/eventDataModel.dart';

import '../../../db/funtion/taskDbFunctions.dart';
import '../../../db/model/dataModel.dart';
import '../../../function/themeColor.dart';
import '../../HomeScreen/widget/addTaskEvent.dart';

class PendingView extends StatelessWidget {
  var data;

  int homeIndex;

  String mode;

  PendingView(
      {super.key,
      required this.data,
      required this.homeIndex,
      this.mode = 'ET'});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                DateFormat('dd MMM yyy hh:mm a').format(data.date),
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'comic',
                    fontSize: 22,
                    color: rWhite),
              ),
              Icon(
                Icons.warning_amber_rounded,
                size: 30,
                color: colorPic(data.priority),
              )
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: Text(data.description,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'comic',
                    fontSize: 21,
                    color: rWhite,
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Text(
                    data.location,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'comic',
                        fontSize: 19,
                        color: rWhite),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.delete_outline,
                    color: rBlack,
                    size: 30,
                  ),
                  onPressed: () {
                    // deleteSelect(homeIndex, context);

                    showDialog(
                      context: context,
                      builder: ((context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: cBlack,
                          title: Text(
                            "Delete",
                            style:
                                TextStyle(color: rWhite, fontFamily: 'comic'),
                          ),
                          content: Text(
                            "Are you sure you want to delete ?",
                            style:
                                TextStyle(color: rWhite, fontFamily: 'comic'),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 213, 213, 213),
                                      fontFamily: 'comic')),
                            ),
                            TextButton(
                                onPressed: () {
                                  (homeIndex == 0)
                                      ? deleteTask(data.id, context)
                                      : deleteEvent(data.id, context);
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Delete",
                                  style: TextStyle(
                                      color: (Colors.red),
                                      fontFamily: 'comic',
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        );
                      }),
                    );
                  },
                ),
                IconButton(
                    onPressed: (() {
                      showDialog(
                        context: context,
                        builder: ((context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: cBlack,
                            content: Text(
                              "Mark this task as 'Done' ? ",
                              style:
                                  TextStyle(color: rWhite, fontFamily: 'comic'),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  // data.isAlarm = false;
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 213, 213, 213),
                                        fontFamily: 'comic')),
                              ),
                              TextButton(
                                  onPressed: () {
                                    markDone(data, context, homeIndex);
                                    Navigator.of(context).pop();
                                    // deleteTask(data.id,
                                    //     context);
                                    // Navigator.pop(
                                    //     context);
                                  },
                                  child: const Text(
                                    "Done",
                                    style: TextStyle(
                                        color: (Colors.red),
                                        fontFamily: 'comic',
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          );
                        }),
                      );
                    }),
                    icon: Icon(
                      Icons.done_all_rounded,
                      color: rBlack,
                      size: 30,
                    )),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        context: context,
                        builder: (BuildContext context) {
                          return AddTaskEvent(
                            mode: mode,
                            homeIndex: 0,
                            data: data,
                          );
                        },
                      );
                    },
                    icon: Icon(
                      Icons.more_time,
                      color: rBlack,
                      size: 28,
                    ))
              ],
            )
          ],
        ));
  }

  Color colorPic(bool priority) {
    if (priority) {
      return cRed;
    } else {
      return cYellow;
    }
  }
}

void markDone(data, BuildContext context, int index) {
  if (index == 0) {
    final updateData = TaskModel(
        id: data.id,
        description: data.description,
        date: data.date,
        time: data.time,
        location: data.location,
        priority: data.priority,
        isAlarm: true);
    print(updateData.isAlarm);
    editTask(data.id, context, updateData);
  } else if (index == 1) {
    final updateData = EventModel(
        id: data.id,
        description: data.description,
        date: data.date,
        time: data.time,
        location: data.location,
        priority: data.priority,
        isAlarm: true,
        imagePath: data.imagePath);
    print(updateData.isAlarm);
    editEvent(data.id, context, updateData);
  }
}
