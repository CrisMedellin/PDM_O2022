import 'package:findtrackapp/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      // no providerConfigs property here as well
      actions: [
        SignedOutAction((context) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        }),
      ],
      providerConfigs: [],
    );
  }
}