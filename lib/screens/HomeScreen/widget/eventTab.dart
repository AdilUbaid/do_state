import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:do_state/db/model/eventDataModel.dart';
import '../../../db/funtion/eventDbFunctions.dart';
import '../ScreenHome.dart';
import 'taskEventContainer.dart';

List<EventModel> globEventList = [];
List<EventModel> futureEventArray = [];
List<EventModel> pastEventArray = [];
DateTime notifiationTImeEvent = DateTime(2017, 9, 7);
EventModel? globNotifiDataEvent;

class EventTab extends StatelessWidget {
  EventTab({super.key, required this.homeIndex});
  var homeIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ValueListenableBuilder(
            valueListenable: eventListNotifier,
            builder: (
              BuildContext ctx,
              List<EventModel> eventList,
              Widget? child,
            ) {
              List<DateTime> dateArrayFinal = [];
              dateArrayFinal = dateSaver(eventList.length, eventList);
              globEventList = List<EventModel>.from(eventList);
              print("this is the time event $notifiationTImeEvent");
              return ListView.builder(
                itemBuilder: (ctx, index) {
                  final data = eventList[index];
                  List<EventModel> sortedDayList = [];
                  sortListByDate(eventList.length, eventList);
                  notifiationTImeEvent = futureEventArray[0].date;
                  globNotifiDataEvent = futureEventArray[0];
                  sortedDayList = eventList
                      .where((e) =>
                          (DateTime(e.date.year, e.date.month, e.date.day) ==
                              dateArrayFinal[index]) &&
                          dateArrayFinal[index].isAfter(afterNow))
                      .toList();
                  sortedDayList.sort(
                      (EventModel a, EventModel b) => a.date.compareTo(b.date));

                  final Box<EventModel> eventBox;
                  return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (ctx, index2) {
                        final data = sortedDayList[index2];
                        final Box<EventModel> eventBox;
                        return TaskEventContainer(
                          homeIndex: homeIndex,
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
  }

  List<DateTime> dateSaver(int length, List<EventModel> list) {
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

  void sortListByDate(int length, List<EventModel> list) {
    pastEventArray.clear();
    for (int i = 0; i < length; i++) {
      if (list[i].date.isAfter(DateTime.now())) {
        futureEventArray.add(list[i]);
      } else if (list[i].date.isBefore(DateTime.now())) {
        pastEventArray.add(list[i]);
      }
    }
    futureEventArray
        .sort((EventModel a, EventModel b) => a.date.compareTo(b.date));
    pastEventArray
        .sort((EventModel b, EventModel a) => a.date.compareTo(b.date));
    print("length of pastevent ${pastEventArray.length}");
  }
}
