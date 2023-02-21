import 'package:flutter/material.dart';

import '../../../db/funtion/taskDbFunctions.dart';
import '../../../db/model/dataModel.dart';
import '../../../function/themeColor.dart';
import '../../HomeScreen/widget/taskTab.dart';
import 'complete_view.dart';


List<TaskModel> donePrevious = [];
List<TaskModel> pendingPrevious = [];

class CmpltPrevious extends StatelessWidget {
  const CmpltPrevious({super.key});

  @override
  
  Widget build(BuildContext context) {
    
    donePrevious =
        pastTaskArray.where((element) => element.isAlarm == true).toList();
    return ListView(children: [
      ValueListenableBuilder(
          valueListenable: taskListNotifier,
          builder: (
            BuildContext ctx,
            List<TaskModel> taskList,
            Widget? child,
          ) {
            return ListView.builder(
                itemCount: donePrevious.length,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  // print("$index index");
                  final data = donePrevious[index];
                  print('$index\n');

                  return
                      // Text('hello world');
                      Padding(
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
                              child: CompleteView(data: data,),
                              ),
                            // ),
                          );
                          
                });
          })
    ]);
  }
}

// }
