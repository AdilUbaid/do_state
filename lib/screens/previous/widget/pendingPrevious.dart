import 'package:flutter/material.dart';
import 'package:do_state/screens/previous/widget/CmpltPrevious.dart';
import 'package:do_state/screens/previous/widget/pending_view.dart';

import '../../../db/funtion/taskDbFunctions.dart';
import '../../../db/model/dataModel.dart';
import '../../../function/themeColor.dart';
import 'package:do_state/screens/HomeScreen/widget/taskTab.dart';

class PendingPrevious extends StatelessWidget {
  var homeIndex;

  PendingPrevious({super.key, required this.homeIndex});

  @override
  Widget build(BuildContext context) {
    pendingPrevious =
        pastTaskArray.where((element) => element.isAlarm == false).toList();
    return ListView(children: [
      ValueListenableBuilder(
          valueListenable: taskListNotifier,
          builder: (
            BuildContext ctx,
            List<TaskModel> taskList,
            Widget? child,
          ) {
            return ListView.builder(
                itemCount: pendingPrevious.length,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  final data = pendingPrevious[index];
                  print('$index\n');

                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    // child: GestureDetector(
                    //   onTap: () {
                    //     Navigator.of(context).push(MaterialPageRoute(
                    //         builder: (context) => TaskView()));
                    //   },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: cGreen),
                      child: PendingView(
                        data: data,
                        homeIndex: homeIndex,
                      ),
                    ),
                  );
                });
          })
    ]);
  }
}
