import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:do_state/db/funtion/taskDbFunctions.dart';
import 'package:share_plus/share_plus.dart';
import '../../../function/themeColor.dart';

import '../../../db/funtion/eventDbFunctions.dart';
import '../../HomeScreen/widget/addTaskEvent.dart';

class BottomBtnTskEvnt extends StatelessWidget {
  var homeIndex;
  var mode;
  var index;
  var id;
  var data;

  BottomBtnTskEvnt(
      {super.key,
      required this.mode,
      required this.homeIndex,
      this.index,
      this.id,
      this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 13, left: 10, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
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
                    homeIndex: homeIndex,
                    data: data,
                  );
                },
              );
            },
            icon: Icon(
              Icons.edit_calendar_outlined,
              color: rBlack,
              size: 30,
            ),
          ),
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
                      style: TextStyle(color: rWhite, fontFamily: 'comic'),
                    ),
                    content: Text(
                      "Are you sure you want to delete ?",
                      style: TextStyle(color: rWhite, fontFamily: 'comic'),
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
                            deleteSelect(homeIndex, context);
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
            onPressed: () async {
              await Share.share(
                  'Task : ${data.description}\n ${DateFormat('dd MMM yyy hh:mm a').format(data.date)}\n at ${data.location}');
            },
            icon: Icon(
              Icons.share_outlined,
              color: rBlack,
              size: 30,
            ),
          )
        ],
      ),
    );
  }

  deleteSelect(homeIndex, BuildContext context) {
    if (homeIndex == 0) {
      deleteTask(id, context);
    } else if (homeIndex == 1) {
      deleteEvent(id, context);
    }
  }
}
