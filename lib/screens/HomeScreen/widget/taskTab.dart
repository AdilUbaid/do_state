import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:do_state/db/funtion/taskDbFunctions.dart';
import 'package:do_state/screens/HomeScreen/ScreenHome.dart';
import '../../../db/model/dataModel.dart';
import 'taskEventContainer.dart';

List<TaskModel> globTaskList = [];
DateTime notifiationTIme = DateTime(2017, 9, 7);
List<TaskModel> futureTaskArray = [];
List<TaskModel> pastTaskArray = [];
TaskModel? globNotifiData;

class TaskTab extends StatefulWidget {
  TaskTab({super.key, required this.homeIndex});

  var homeIndex;

  @override
  State<TaskTab> createState() => _TaskTabState();
}

class _TaskTabState extends State<TaskTab> {
  @override
  Widget build(BuildContext context) {
    // int flag = 0;
    return Stack(
      children: [
        ValueListenableBuilder(
            valueListenable: taskListNotifier,
            builder: (
              BuildContext ctx,
              List<TaskModel> taskList,
              Widget? child,
            ) {
              List<DateTime> dateArrayFinal = [];
              dateArrayFinal = dateSaver(taskList.length, taskList);
              globTaskList = List<TaskModel>.from(taskList);
              print("this is the time $notifiationTIme");
              return ListView.builder(
                itemBuilder: (ctx, index) {
                  final data = taskList[index];
                  List<TaskModel> sortedDayList = [];
                  sortListByDate(taskList.length, taskList);
                  notifiationTIme = futureTaskArray[0].date;
                  globNotifiData = futureTaskArray[0];
                  sortedDayList = taskList
                      .where((e) =>
                          (DateTime(e.date.year, e.date.month, e.date.day) ==
                              dateArrayFinal[index]) &&
                          dateArrayFinal[index].isAfter(afterNow))
                      .toList();
                  sortedDayList.sort(
                      (TaskModel a, TaskModel b) => a.date.compareTo(b.date));

                  final Box<TaskModel> taskBox;
                  return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (ctx, index2) {
                        final data = sortedDayList[index2];
                        final Box<TaskModel> taskBox;
                        return TaskEventContainer(
                          homeIndex: widget.homeIndex,
                          data: data,
                          index: index2,
                          id: data.id,
                        );
                      },
                      itemCount: sortedDayList.length);
                },
                itemCount: dateArrayFinal.length,
                // itemCount: 1,
              );
            }),
      ],
    );
    //
  }

  List<DateTime> dateSaver(int length, List<TaskModel> list) {
    List<DateTime> dateArray = [];
    for (int i = 0; i < length; i++) {
      dateArray.add(
          DateTime(list[i].date.year, list[i].date.month, list[i].date.day));
    }

    dateArray = dateArray.toSet().toList();
    dateArray.sort((DateTime a, DateTime b) => a.compareTo(b));
    for (int i = 0; i < dateArray.length; i++) {}
    return dateArray;
  }

  void sortListByDate(int length, List<TaskModel> list) {
    pastTaskArray.clear();
    for (int i = 0; i < length; i++) {
      if (list[i].date.isAfter(DateTime.now())) {
        futureTaskArray.add(list[i]);
      } else if (list[i].date.isBefore(DateTime.now())) {
        pastTaskArray.add(list[i]);
      }
    }
    futureTaskArray
        .sort((TaskModel a, TaskModel b) => a.date.compareTo(b.date));
    pastTaskArray.sort((TaskModel b, TaskModel a) => a.date.compareTo(b.date));
  }
}
