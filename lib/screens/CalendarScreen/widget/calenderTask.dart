import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:do_state/screens/CalendarScreen/widget/Calendar.dart';
import '../../../db/model/dataModel.dart';
import '../../../db/model/eventDataModel.dart';
import '../../../function/themeColor.dart';
import '../../SearchScreen/widget/searchView.dart';
import '../provider/provider_calendar_scrn.dart';

final provCalTask =
    StateProvider<ValueNotifier<DateTime>>((ref) => pickedDateNotifier);

DateTime newddate = DateTime.now();
ValueNotifier<DateTime> pickedDateNotifier = ValueNotifier(focusedDay);

class CalenderTask extends ConsumerWidget {
  CalenderTask({super.key});

  bool isExpandedk = true;

  bool taskIndex = true;

  bool eventIndex = true;

  final List<TaskModel> allTaskSearchList =
      Hive.box<TaskModel>('task_db').values.toList();

  late List<TaskModel> displayTaskSearchList = [];

  final List<EventModel> allEventSearchList =
      Hive.box<EventModel>('event_db').values.toList();

  late List<EventModel> displayEventSearchList = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(provCalTask);

    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: pickedDateNotifier,
        builder: (BuildContext context, DateTime value, Widget? child) {
          return ListView.builder(
            // physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int count) {
              tskEvntOfday();
              return Padding(
                padding:
                    const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
                child: Wrap(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: ExpansionPanelList(
                        expandedHeaderPadding: EdgeInsets.all(0),
                        elevation: 0,
                        expansionCallback: (int index, bool isExpanded) {
                          //   setState(() {
                          //     taskIndex = !(indexExpPanel(count));
                          //     // taskIndex = !eventIndex;
                          //   });
                        },
                        children: [
                          ExpansionPanel(
                              backgroundColor: cGreen,
                              headerBuilder:
                                  (BuildContext context, bool isExpanded) {
                                return ListTile(
                                  title: Center(
                                    child: Text(
                                      headingText(count),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'comic',
                                        color: rBlack,
                                        fontSize: 23,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              body: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17),
                                    color: cGreen),
                                child: Column(
                                  children: [
                                    (dbSelect(count).isNotEmpty)
                                        ? ListView.separated(
                                            itemCount: dbSelect(count).length,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              var data = dbSelect(count)[index];
                                              return SearchView(
                                                data: data,
                                                index: index,
                                              );
                                            },
                                            separatorBuilder: (ctx, index) {
                                              return const Divider();
                                            },
                                          )
                                        : Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  "The data is not Found",
                                                  style: TextStyle(
                                                      fontFamily: 'comic',
                                                      color: rBlack,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14)),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                              isExpanded: indexExpPanel(count))
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: 2,
          );
        },
      ),
    );
  }

  void tskEvntOfday() {
    displayTaskSearchList = allTaskSearchList
        .where((element) =>
            DateTime(element.date.year, element.date.month, element.date.day) ==
            DateTime(focusedDay.year, focusedDay.month, focusedDay.day))
        .toList();
    displayEventSearchList = allEventSearchList
        .where((element) =>
            DateTime(element.date.year, element.date.month, element.date.day) ==
            DateTime(focusedDay.year, focusedDay.month, focusedDay.day))
        .toList();
  }

  List dbSelect(count) {
    if (count == 0) {
      print(allTaskSearchList[0].date);
      print(focusedDay);
      print('count $count');
      print(displayEventSearchList.length);

      return displayTaskSearchList;
    } else {
      print('count $count');
      // print(displayEventSearchList.length);
      return displayEventSearchList;
    }
  }

  bool indexExpPanel(int index) {
    if (index == 0) {
      return taskIndex;
    } else {
      return eventIndex;
    }
  }

  String headingText(int index) {
    if (index == 0) {
      return 'Tasks';
    } else {
      return 'Events';
    }
  }

  // void tskEvntOfday() {}
}
