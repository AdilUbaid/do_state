import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:do_state/main.dart';
// import 'package:do_state/screens/HomeScreen/widget/taskEventContainer.dart';
// import 'package:do_state/screens/taskView/widget/taskViewContainer.dart';

import '../../../function/themeColor.dart';
import 'SearchViewContainer.dart';

class SearchView extends StatelessWidget {
  var data;

  var index;

  SearchView({super.key, required this.data, this.index});

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: visibility(index),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  // child: Text(
                  //   'Tasks',
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     fontFamily: 'comic',
                  //     fontSize: 23,
                  //   ),
                  // ),
                ),
              ),
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          data.description,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'comic',
                            color: rBlack,
                            fontSize: 17,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3, left: 10),
                          child: Icon(
                            Icons.circle,
                            color: colorSearch(data.priority),
                            size: 17,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      DateFormat('dd MMM yyy hh mm a').format(data.date),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: rBlack,
                        fontFamily: 'comic',
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () async {
                await showDialog(
                    context: context,
                    builder: (_) => SearchViewContainer(
                          data: data,
                          index: index,
                          id: data.id,
                        ));
              },
            )
          ],
        ),
      ),
    );
  }

  // Widget searchViewContainer(){
  bool visibility(index) {
    if (index == 0) {
      return isVisible = true;
    } else {
      return isVisible = false;
    }
  }

  Color colorSearch(bool priority) {
    if (priority)
      return cRed;
    else
      return cYellow;
  }
}
