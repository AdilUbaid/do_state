import 'package:flutter/material.dart';
import 'package:do_state/screens/NavigationDrawer/widget/popup.dart';

import '../../../function/themeColor.dart';

class TermsAndCOnditionsNav extends StatelessWidget {
  const TermsAndCOnditionsNav({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.library_books_outlined,
        color: rWhite,
      ),
      title: Text('Terms and conditions',
          style: TextStyle(
            // height: 2,
            color: rWhite,
            fontFamily: 'comic',
            fontSize: 22,
          )),
      onTap: () {
        showDialog(
            context: context,
            builder: (builder) {
              return settingmenupopup(mdFilename: 'terms_and_conditions.md');
            });
      },
    );
  }
}
