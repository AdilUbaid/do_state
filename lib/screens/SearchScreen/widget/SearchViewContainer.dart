import 'dart:io';

import 'package:flutter/material.dart';
import 'package:do_state/main.dart';

import '../../../function/themeColor.dart';
import '../../taskView/widget/taskViewContainer.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class SearchViewContainer extends StatelessWidget {
  var data;

  var id;

  var index;

  // ImageDialog(thidata);
  SearchViewContainer({super.key, required this.data, this.id, this.index});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        // child:
        // ClipRRect(
        // borderRadius: BorderRadius.circular(17),
        child: Container(
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: cGreen),
            child: TaskViewContainer(data: data, index: index, id: id)));
    // ));
  }
}
