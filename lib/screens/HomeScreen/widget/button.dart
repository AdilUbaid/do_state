import 'package:flutter/material.dart';

import '../../../function/themeColor.dart';
import '../../../main.dart';

class Button extends StatelessWidget {
  bool lowHigh;
  String bText = 'low';
  Color btColor = cRed;

  Button({super.key, required this.lowHigh});

  @override
  Widget build(BuildContext context) {
    // String BText;
    textColor(lowHigh);
    return TextButton(
        onPressed: () {},
        child: Container(
          width: 65,
          // ignore: sort_child_properties_last
          child: Padding(
            padding: EdgeInsets.only(bottom: 4),
            child: Text(
              bText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'comic',
                  fontSize: 20,
                  color: rBlack),
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: btColor),
        ));
  }

  textColor(bool lowHigh) {
    if (lowHigh) {
      bText = 'high';
      btColor = cRed;
    } else {
      bText = 'low';
      btColor = cYellow;
    }
  }
}
