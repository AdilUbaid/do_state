import 'package:flutter/material.dart';
import 'package:do_state/db/funtion/taskDbFunctions.dart';
import 'package:do_state/main.dart';

import '../../db/funtion/eventDbFunctions.dart';
import '../../function/themeColor.dart';
import '../HomeScreen/ScreenHome.dart';

// import '../db/funtion/eventDBFunctions.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

//   @override
  @override
  Widget build(BuildContext context) {
    getAllTask();
    getAllEvent();
    // super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: ((ctx) => ScreenHome())));
    });
    return Scaffold(
      backgroundColor: cGreen,
      body: // Figma Flutter Generator SplashWidget - FRAME

          Center(
              child: Text(
        'DO.',
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'comic',
            fontSize: 27,
            color: cTeal),
        textAlign: TextAlign.center,
      )),
    );
  }
}
