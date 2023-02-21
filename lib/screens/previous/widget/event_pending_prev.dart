import 'package:flutter/material.dart';
import 'package:do_state/db/funtion/eventDbFunctions.dart';
import 'package:do_state/db/model/eventDataModel.dart';
// import 'package:do_state/screens/previous/widget/CmpltPrevious.dart';
import 'package:do_state/screens/previous/widget/pending_view.dart';

import '../../../function/themeColor.dart';
import '../../HomeScreen/widget/eventTab.dart';

List<EventModel> eventPendingPrevious = [];

class EvntPendingPrevious extends StatefulWidget {
  var homeIndex;

  EvntPendingPrevious({super.key, required this.homeIndex});

  @override
  State<EvntPendingPrevious> createState() => _EvntPendingPreviousState();
}

class _EvntPendingPreviousState extends State<EvntPendingPrevious> {
  // get pastEventArray => null;

  @override
  Widget build(BuildContext context) {
    print("length ${pastEventArray.length}");
    eventPendingPrevious =
        pastEventArray.where((element) => element.isAlarm == false).toList();
    return ListView(children: [
      ValueListenableBuilder(
          valueListenable: eventListNotifier,
          builder: (
            BuildContext ctx,
            List<EventModel> eventList,
            Widget? child,
          ) {
            return ListView.builder(
                itemCount: eventPendingPrevious.length,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  final data = eventPendingPrevious[index];
                  print('$index\n');

                  return Padding(
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
                      child: PendingView(
                        homeIndex: widget.homeIndex,
                        data: data,
                        mode: 'EE',
                      ),
                    ),
                  );
                });
          })
    ]);
  }
}
