import 'package:flutter/material.dart';
import 'package:do_state/screens/previous/widget/event_complt_prev.dart';
import 'package:do_state/screens/previous/widget/event_pending_prev.dart';

import '../../function/themeColor.dart';
import 'widget/CmpltPrevious.dart';
import 'widget/pendingPrevious.dart';

class PreviousScreen extends StatefulWidget {
  var homeIndex;

  PreviousScreen({super.key, required this.homeIndex});

  @override
  State<PreviousScreen> createState() => _PreviousScreenState();
}

class _PreviousScreenState extends State<PreviousScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBlack,
      // appBar: AppBar(
      //   excludeHeaderSemantics: true,

      // automaticallyImplyLeading: false,
      // backgroundColor: cBlack,
      // elevation: 0,
      // bottom:
      // ),
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              controller: controller,
              // ignore: prefer_const_literals_to_create_immutables
              tabs: [
                const Tab(
                  child: Text(
                    'Pending',
                    style: TextStyle(
                        // height: 3,
                        // color: Colors.white,
                        fontFamily: 'comic',
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Tab(
                  child: Text(
                    'completed',
                    style: TextStyle(
                        // height: 3,
                        // color: Colors.white,
                        fontFamily: 'comic',
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
              // indicator:Color,
              indicatorColor: rWhite,
            ),
            Expanded(
              // ignore: prefer_const_literals_to_create_immutables
              child: (widget.homeIndex == 0)
                  ? TabBarView(controller: controller, children: [
                      PendingPrevious(
                        homeIndex: widget.homeIndex,
                      ),
                      const CmpltPrevious(),

                      //  EvntPendingPrevious (),
                      //  EvntCmpltPrevious()
                    ])
                  :
                  // ignore: prefer_const_literals_to_create_immutables
                  TabBarView(controller: controller, children: [
                      //  PendingPrevious(),
                      //  CmpltPrevious():

                      EvntPendingPrevious(
                        homeIndex: widget.homeIndex,
                      ),
                      const EvntCmpltPrevious()
                    ]),
            ),
          ],
        ),
      ),
    );
  }
}
