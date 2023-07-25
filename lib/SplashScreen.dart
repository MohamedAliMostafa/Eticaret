import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:eticaret/Features/Login/presentation/pages/Login.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  
 static const String RouteName="Spl";

  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
      splash: 'assets/images/splash.png',splashIconSize: double.infinity,
      splashTransition: SplashTransition.sizeTransition,
      nextScreen: Login(),

    );
  }
}
