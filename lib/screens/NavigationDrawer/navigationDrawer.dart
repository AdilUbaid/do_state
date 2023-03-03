import 'package:flutter/material.dart';
import 'package:do_state/function/themeColor.dart';
import 'package:do_state/screens/NavigationDrawer/widget/navigation_about.dart';

import 'widget/navigation_privacypolicy.dart';
import 'widget/share_navigation.dart';
import 'widget/terms_and_conditions.dart';

class NavigationDrawerx extends StatelessWidget {
  const NavigationDrawerx({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: cBlack,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const AboutNavigation(),
                const PrivacyPolicyNavigation(),
                const TermsAndCOnditionsNav(),
                const ShareNavigation(),
              ],
            ),
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text('version',
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'comic',
                      fontSize: 20,
                    )),
                const Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text('1.0.1',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'comic',
                        fontSize: 18,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
