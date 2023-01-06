import 'package:flutter/material.dart';
import '../../CalendarScreen/CalendarScreen.dart';
import '../../previous/previous.dart';
import 'addTaskEvent.dart';
import '../../../function/themeColor.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key, required this.homeIndex});

  var homeIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      // overflow: Overflow.visible,
      alignment: FractionalOffset(.5, 1.0),
      children: [
        Container(
          height: 60.0,
          color: cGreen,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4, left: 38),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PreviousScreen(
                            homeIndex: homeIndex,
                          ))),
                  child: Column(
                    children: [
                      Icon(
                        Icons.view_list_rounded,
                        color: accentYellow,
                        size: 35,
                      ),
                      Text(
                        'Previous',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'comic',
                            fontSize: 14,
                            color: accentYellow),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4, right: 38),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CalendarScreen())),
                  child: Column(
                    children: [
                      Icon(
                        Icons.calendar_month_rounded,
                        color: accentYellow,
                        size: 35,
                      ),
                      Text(
                        'Calendar',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'comic',
                            fontSize: 14,
                            color: accentYellow),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: FloatingActionButton(
            backgroundColor: cGreen,
            // notchMargin: 24.0,
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                context: context,
                builder: (BuildContext context) {
                  return AddTaskEvent(
                    homeIndex: homeIndex,
                    mode: (homeIndex == 1) ? 'AE' : 'AT',
                    // mode:,
                  );
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: accentYellow, width: 4),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Icon(
                  Icons.add,
                  size: 27,
                  color: accentYellow,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
