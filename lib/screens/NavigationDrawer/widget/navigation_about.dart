import 'package:flutter/material.dart';

import '../../../function/themeColor.dart';

class AboutNavigation extends StatelessWidget {
  const AboutNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // contentPadding: EdgeInsets.symmetric(),
      leading: Icon(
        Icons.info_outline_rounded,
        color: rWhite,
      ),
      title: Text('About',
          style: TextStyle(
            color: rWhite,
            fontFamily: 'comic',
            fontSize: 22,
            // fontWeight: FontWeight.bold
          )),
      onTap: () {
        showAboutDialog(
            context: context,
            applicationName: "Do.",
            applicationIcon: Image.asset(
              "assets/image/icon.jpg",
              height: 40,
              width: 40,
            ),
            applicationVersion: "1.0.1",
            children: [
              const Text(
                  "Do is an offline task and event manager app which also provides reminder and alarm features.Do makes scheduling and oraganising tasks easier "),
              const SizedBox(
                height: 10,
              ),
              const Text("App developed by Adil Ubaid.")
            ]);
      },
    );
  }
}
