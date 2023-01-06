import 'dart:io';
import 'package:flutter/material.dart';
import 'package:do_state/screens/EventsView/widget/imageDisplay.dart';
import '../../../main.dart';
import '../../taskView/widget/taskViewContainer.dart';
import '../../../function/themeColor.dart';

class EventContainer extends StatelessWidget {
  var data;

  var index;

  EventContainer({super.key, this.data, this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          InkWell(
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: rWhite,
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: FileImage(
                    File(data.imagePath),
                  ),

                  // scale: 0.9,
                ),
              ),
            ),
            onTap: () async {
              await showDialog(
                  context: context,
                  builder: (_) => ImageDialog(
                        data: data,
                      ));
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(154, 76, 75, 75),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TaskViewContainer(
                mode: 'EE',
                homeIndex: 1,
                data: data,
                index: index,
                id: data.id,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
