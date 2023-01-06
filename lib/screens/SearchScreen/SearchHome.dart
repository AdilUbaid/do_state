import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:do_state/db/model/dataModel.dart';
import 'package:do_state/db/model/eventDataModel.dart';
import 'package:do_state/screens/SearchScreen/widget/chips.dart';
import 'package:do_state/screens/SearchScreen/widget/dateRange.dart';
import 'package:do_state/screens/SearchScreen/widget/searchBar.dart';
import 'package:do_state/screens/SearchScreen/widget/searchView.dart';

import '../../function/themeColor.dart';

String globSearchKey = '';
String globAction = 'X';

class SearchHome extends StatefulWidget {
  SearchHome({Key? key}) : super(key: key);

  @override
  State<SearchHome> createState() => _SearchHomeState();
}

class _SearchHomeState extends State<SearchHome> {
  bool isExpandedk = true;
  bool taskIndex = true;
  bool eventIndex = true;
  final List<TaskModel> allTaskSearchList =
      Hive.box<TaskModel>('task_db').values.toList();

  late List<TaskModel> displayTaskSearchList =
      List<TaskModel>.from(allTaskSearchList);

  final List<EventModel> allEventSearchList =
      Hive.box<EventModel>('event_db').values.toList();

  late List<EventModel> displayEventSearchList =
      List<EventModel>.from(allEventSearchList);

  @override
  Widget build(BuildContext context) {
    bool _selected = false;
    return Scaffold(
      backgroundColor: cBlack,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SearchBar(
                // function: searchTaskList,
                function: rangeSearch,
              ),
              Wrap(
                runSpacing: 5.0,
                spacing: 5.0,
                children: [
                  chips(
                    title: 'high',
                    actionKey: 'H',
                    function: rangeSearch,
                    // function: searchTaskList,
                  ),
                  chips(
                    title: 'low',
                    actionKey: 'L',
                    // function: searchTaskList,
                    function: rangeSearch,
                  ),
                  chips(
                    title: 'this week',
                    actionKey: 'T',
                    // function: searchTaskList,
                    function: rangeSearch,
                  ),
                  // DateRange(
                  //   actionKey: 'R',
                  //   function: searchTaskList,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Container(
                      height: 32,
                      // width: ,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.grey),
                      child: TextButton(
                          onPressed: () {
                            // picRange(context, searchTaskList);
                            picRange(
                              context,
                              rangeSearch,
                            );
                          },
                          child: Text(
                            'Date',
                            style:
                                TextStyle(color: rBlack, fontFamily: 'comic'),
                          )),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: ListView.builder(
                // physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int count) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Wrap(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: ExpansionPanelList(
                            expandedHeaderPadding: EdgeInsets.all(0),
                            elevation: 0,
                            expansionCallback: (int index, bool isExpanded) {
                              setState(() {
                                taskIndex = !(indexExpPanel(count));
                                // taskIndex = !eventIndex;
                              });
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
                                          borderRadius:
                                              BorderRadius.circular(17),
                                          color: cGreen),
                                      child: Column(
                                        children: [
                                          (dbSelect(count).isNotEmpty)
                                              ? ListView.separated(
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index) {
                                                    var data =
                                                        dbSelect(count)[index];
                                                    return SearchView(
                                                      data: data,
                                                      index: index,
                                                    );
                                                  },
                                                  separatorBuilder:
                                                      (ctx, index) {
                                                    return const Divider();
                                                  },
                                                  itemCount:
                                                      dbSelect(count).length,
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
                                                )),
                                        ],
                                      )),
                                  isExpanded: indexExpPanel(count))
                              // }).toList(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 2,
              ))
            ],
          ),
        ),
      ),
    );
  }

  void rangeSearch(String value, [String action = 'X', String range = 'X']) {
    setState(() {
      switch (range) {
        case 'T':
          DateTime tempDateSwitch = DateTime.now();
          displayTaskSearchList = allTaskSearchList
              .where((element) =>
                  element.date.isAfter(DateTime.now()) &&
                  element.date.isBefore(DateTime(tempDateSwitch.year,
                      tempDateSwitch.month, (tempDateSwitch.day + 7))))
              .toList();

          displayEventSearchList = allEventSearchList
              .where((element) =>
                  element.date.isAfter(DateTime.now()) &&
                  element.date.isBefore(DateTime(tempDateSwitch.year,
                      tempDateSwitch.month, (tempDateSwitch.day + 7))))
              .toList();
          searchTaskList(value, action);
          break;
        case 'R':
          displayTaskSearchList = allTaskSearchList
              .where((element) =>
                  element.date.isAfter(DateTime(dateRange.start.year,
                      dateRange.start.month, dateRange.start.day)) &&
                  element.date.isBefore(DateTime(dateRange.end.year,
                      dateRange.end.month, dateRange.end.day + 1)))
              .toList();

          displayEventSearchList = allEventSearchList
              .where((element) =>
                  element.date.isAfter(DateTime(dateRange.start.year,
                      dateRange.start.month, dateRange.start.day)) &&
                  element.date.isBefore(DateTime(dateRange.end.year,
                      dateRange.end.month, dateRange.end.day + 1)))
              .toList();
          searchTaskList(value, action);
          break;
        default:
          searchTaskList(value, action);
          break;
      }
    });
  }

  void searchTaskList(String value, [String action = 'X']) {
    globAction = action;
    setState(
      () {
        switch (action) {
          case 'H':
            displayTaskSearchList = displayTaskSearchList
                .where((element) => element.priority == true)
                .toList();

            displayEventSearchList = displayEventSearchList
                .where((element) => element.priority == true)
                .toList();
            break;
          case 'L':
            displayTaskSearchList = displayTaskSearchList
                .where((element) => element.priority == false)
                .toList();

            displayEventSearchList = displayEventSearchList
                .where((element) => element.priority == false)
                .toList();
            break;
          case 'T':
            DateTime tempDateSwitch = DateTime.now();
            displayTaskSearchList = allTaskSearchList
                .where((element) =>
                    element.date.isAfter(DateTime.now()) &&
                    element.date.isBefore(DateTime(tempDateSwitch.year,
                        tempDateSwitch.month, (tempDateSwitch.day + 7))))
                .toList();

            displayEventSearchList = allEventSearchList
                .where((element) =>
                    element.date.isAfter(DateTime.now()) &&
                    element.date.isBefore(DateTime(tempDateSwitch.year,
                        tempDateSwitch.month, (tempDateSwitch.day + 7))))
                .toList();
            break;
          case 'R':
            displayTaskSearchList = allTaskSearchList
                .where((element) =>
                    element.date.isAfter(DateTime(dateRange.start.year,
                        dateRange.start.month, dateRange.start.day)) &&
                    element.date.isBefore(DateTime(dateRange.end.year,
                        dateRange.end.month, dateRange.end.day + 1)))
                .toList();

            displayEventSearchList = allEventSearchList
                .where((element) =>
                    element.date.isAfter(DateTime(dateRange.start.year,
                        dateRange.start.month, dateRange.start.day)) &&
                    element.date.isBefore(DateTime(dateRange.end.year,
                        dateRange.end.month, dateRange.end.day + 1)))
                .toList();
            break;
          default:
            displayTaskSearchList = allTaskSearchList
                .where((element) => element.description
                    .toLowerCase()
                    .contains(value.toLowerCase()))
                .toList();
            displayEventSearchList = allEventSearchList
                .where((element) => element.description
                    .toLowerCase()
                    .contains(value.toLowerCase()))
                .toList();
            break;
        }
        displayTaskSearchList = displayTaskSearchList
            .where((element) =>
                element.description.toLowerCase().contains(value.toLowerCase()))
            .toList();
        displayEventSearchList = displayEventSearchList
            .where((element) =>
                element.description.toLowerCase().contains(value.toLowerCase()))
            .toList();
      },
    );
  }

  List dbSelect(count) {
    if (count == 0) {
      return displayTaskSearchList;
    } else {
      return displayEventSearchList;
    }
  }

  bool indexExpPanel(int index) {
    // bool taskIndex=;
    if (index == 0) {
      return taskIndex;
    } else {
      return eventIndex;
    }
  }

  String headingText(int index) {
    // bool taskIndex=;
    if (index == 0) {
      return 'Tasks';
    } else {
      return 'Events';
    }
  }
}
