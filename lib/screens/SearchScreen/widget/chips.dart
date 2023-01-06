import 'package:flutter/material.dart';
import 'package:do_state/screens/SearchScreen/SearchHome.dart';

import '../../../function/themeColor.dart';
// import '../../../main.dart';

int x = 10;

class chips extends StatefulWidget {
  String title;
  String actionKey;
  Function function;
  var range;

  chips(
      {super.key,
      required this.title,
      required this.actionKey,
      required this.function,
      this.range});

  @override
  State<chips> createState() => _chipsState();
}

class _chipsState extends State<chips> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 3, right: 3),
      child: Container(
        height: 30,
        child: FilterChip(
            label: Text(
              widget.title,
              style: TextStyle(color: rBlack, fontFamily: 'comic'),
            ),
            selected: isSelected,
            backgroundColor: Colors.grey,
            selectedColor: Color.fromARGB(255, 255, 255, 255),
            onSelected: (newState) {
              // widget.function('tsk', widget.actionKey);
              if (!isSelected)
                widget.function(globSearchKey, globAction = widget.actionKey,
                    widget.actionKey);
              else
                widget.function(
                  globSearchKey,
                );

              // actionSelectChip(widget.actionKey);
              setState(() {
                isSelected = newState;
              });
            }),
      ),
    );
  }

  // void actionSelectChip(String action) {
  //   switch (action) {
  //     case 'H':

  //       break;
  //   }
  // }
}
