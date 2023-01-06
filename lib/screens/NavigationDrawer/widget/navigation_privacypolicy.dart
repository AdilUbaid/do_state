import 'package:flutter/material.dart';
import 'package:do_state/screens/NavigationDrawer/widget/popup.dart';

import '../../../function/themeColor.dart';

class PrivacyPolicyNavigation extends StatelessWidget {
  const PrivacyPolicyNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.policy_outlined,
        color: rWhite,
      ),
      title: Text('Privacy policy',
          style: TextStyle(
            // height: 2,
            color: rWhite,
            fontFamily: 'comic',
            fontSize: 22,
            // fontWeight: FontWeight.bold
          )),
      onTap: () {
        showDialog(
            context: context,
            builder: (builder) {
              return settingmenupopup(mdFilename: 'privacy_policy.md');
            });
      },
    );
  }
}
