import 'package:flutter/material.dart';
import 'package:do_state/main.dart';
import 'widget/eventContainer.dart';
import '../../../function/themeColor.dart';

// ignore: must_be_immutable
class EventsView extends StatelessWidget {
  var index;

  EventsView({super.key, this.data, this.index});
  var data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: cBlack,
          title: Text(
            'TODAY',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontFamily: 'comic', fontSize: 26),
          ),
        ),
        backgroundColor: cBlack,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              EventContainer(data: data, index: index),
            ],
          ),
        ));
  }
}
