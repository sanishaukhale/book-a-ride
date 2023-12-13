import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';

import '../login_with_email/login_with_email.dart';
import '/home/home.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoaded = false;
  bool sharedPref = false;
  getSharedPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('loggedIn') == null) {
      sharedPref = false;
    } else {
      sharedPref = prefs.getBool('loggedIn')!;
    }
  }

  @override
  void initState() {
    super.initState();
    getSharedPref();
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => setState(
        () {
          isLoaded = true;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenView(
        navigateWhere: isLoaded,
        navigateRoute: sharedPref ? const HomeScreen() : LoginWithEmail(),
        logoSize:500,
        text: FadeAnimatedText(
          "Welcome",
          textStyle: const TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        pageRouteTransition: PageRouteTransition.SlideTransition,
        imageSrc: "assets/images/logo.png",
        displayLoading: true,
      ),
    );
  }
}
