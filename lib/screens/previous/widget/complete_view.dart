import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../db/funtion/taskDbFunctions.dart';
import '../../../function/themeColor.dart';
import '../../HomeScreen/widget/addTaskEvent.dart';

class CompleteView extends StatelessWidget {
  var data;
  
  String mode;

  CompleteView({super.key, required this.data,this.mode="ET"});

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
                    deleteComplete(context);
                    // deleteSelect(homeIndex, context);
                  },
                ),
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
                      Icons.loop_rounded,
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

  void deleteComplete(BuildContext context) {
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
                  deleteTask(data.id, context);
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
  }
}
