import 'package:flutter/material.dart';
import 'package:do_state/screens/previous/widget/event_complt_prev.dart';
import 'package:do_state/screens/previous/widget/event_pending_prev.dart';

import '../../function/themeColor.dart';
import 'widget/CmpltPrevious.dart';
import 'widget/pendingPrevious.dart';

// ignore: must_be_immutable
class PreviousScreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var homeIndex;

  PreviousScreen({super.key, required this.homeIndex});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: cBlack,
        body: SafeArea(
          child: Column(
            children: [
              TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                // ignore: prefer_const_literals_to_create_immutables
                tabs: [
                  const Tab(
                    child: Text(
                      'Pending',
                      style: TextStyle(
                          fontFamily: 'comic',
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Tab(
                    child: Text(
                      'completed',
                      style: TextStyle(
                          fontFamily: 'comic',
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
                indicatorColor: rWhite,
              ),
              Expanded(
                // ignore: prefer_const_literals_to_create_immutables
                child: (homeIndex == 0)
                    ? TabBarView(children: [
                        PendingPrevious(
                          homeIndex: homeIndex,
                        ),
                        const CmpltPrevious(),
                      ])
                    :
                    // ignore: prefer_const_literals_to_create_immutables
                    TabBarView(children: [
                        EvntPendingPrevious(
                          homeIndex: homeIndex,
                        ),
                        const EvntCmpltPrevious()
                      ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
