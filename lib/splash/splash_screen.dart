import 'package:flutter/material.dart';
import 'package:tbib_splash_screen/splash_screen.dart';

import '../login_with_email/login_with_email.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => setState(() {
          isLoaded = true;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return  SplashScreenView(
      navigateWhere: isLoaded,
      navigateRoute:  LoginWithEmail(),
      backgroundColor: Colors.blueAccent,

      pageRouteTransition: PageRouteTransition.SlideTransition,
      imageSrc: "assets/images/logo.png",
      //displayLoading: false,
    );
  }
}
