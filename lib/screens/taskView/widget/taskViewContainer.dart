import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../function/themeColor.dart';
import '../../../main.dart';
import '../../EventsView/widget/tskEvntBottom.dart';
import '../../HomeScreen/widget/button.dart';

class TaskViewContainer extends StatelessWidget {
  var index;

  var id;

  TaskViewContainer(
      {super.key,
      this.mode = 'ET',
      this.homeIndex = 0,
      this.data,
      this.index,
      this.id});

  String mode;
  var homeIndex;
  var data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      data.description,
                      // "Tax payment",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: rBlack,
                          fontFamily: 'comic',
                          fontSize: 23),
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Button(lowHigh: data.priority)),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 8, bottom: 4, top: 0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(
                          Icons.access_time,
                          color: rBlack,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                              DateFormat('dd MMM yyy hh mm a')
                                  .format(data.date),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: rBlack,
                                fontFamily: 'comic',
                                fontSize: 20,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: rBlack,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(data.location,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'comic',
                                color: rBlack,
                                fontSize: 20,
                              )),
                        ),
                      ],
                    ),
                  ),
                  BottomBtnTskEvnt(
                    mode: mode,
                    homeIndex: homeIndex,
                    index: index,
                    id: id,
                    data: data,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
