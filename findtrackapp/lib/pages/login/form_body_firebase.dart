import 'package:animated_background/animated_background.dart';
import 'package:findtrackapp/pages/home_page.dart';
import 'package:findtrackapp/utils/secrets.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class FormBodyFirebase extends StatefulWidget {
  FormBodyFirebase({
    Key? key,
  }) : super(key: key);

  @override
  State<FormBodyFirebase> createState() => _FormBodyFirebaseState();
}

class _FormBodyFirebaseState extends State<FormBodyFirebase> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return 
      AnimatedBackground(
      vsync: this,
      behaviour: RandomParticleBehaviour(
        options: const ParticleOptions(
          spawnMaxRadius: 50,
          spawnMinSpeed: 10.00,
          particleCount: 68,
          minOpacity: 0.3,
          spawnOpacity: 0.4,
          baseColor: Colors.purple
        )
      ),
      child: 
      Center(
        child: 
          Container (
            height: 300,
            child: 
              SignInScreen(
                showAuthActionSwitch: false,
                // headerBuilder: (context, constraints, breackpoint) {

                // },
                providerConfigs: [
                  // EmailProviderConfiguration(), //For normal sign in 
                  GoogleProviderConfiguration(clientId: GOOGLE_CLIENT_ID),
                ],
                footerBuilder: (context, action) {
                  return Text("By signing in, you agree to our terms and conditions");
                },
                actions: [
                  AuthStateChangeAction<SignedIn>((context, state){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage(),),);
                  }),
                ],
              )
          )
      )
    );
  }
}

// https://firebase.flutter.dev/docs/ui/auth