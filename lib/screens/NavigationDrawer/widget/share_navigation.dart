import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:share_plus/share_plus.dart';

import '../../../function/themeColor.dart';

class ShareNavigation extends StatelessWidget {
  const ShareNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.share_outlined,
        color: rWhite,
      ),
      title: Text('Share',
          style: TextStyle(
            color: rWhite,
            fontFamily: 'comic',
            fontSize: 22,
          )),
      onTap: () {
        Share.share("https://github.com/AdilUbaid/DO-",
            subject: "Github Repo Of This App");
      },
    );
  }
}
