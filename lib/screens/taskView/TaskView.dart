// import 'package:flutter/cupertino.dart';
// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:do_state/main.dart';

import '../../function/themeColor.dart';
import 'widget/taskViewContainer.dart';
// import 'package:do_state/widget/taskView/widget/taskViewContainer.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class TaskView extends StatelessWidget {
  var index;

  var id;

  TaskView({super.key, this.mode = 1, this.data, this.index, this.id});
  var data;
  int mode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: cBlack,
        title: Text(
          'TODAY',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontFamily: 'comic', fontSize: 26),
        ),
      ),
      backgroundColor: cBlack,
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            child: Container(
                // height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17), color: cGreen),
                child: Column(
                  children: [
                    TaskViewContainer(data: data, index: index, id: id),
                    // TaskViewContainer(),
                    // TaskViewContainer(),
                    // TaskViewContainer(),
                    // TaskViewContainer(),
                    // TaskViewContainer(),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
