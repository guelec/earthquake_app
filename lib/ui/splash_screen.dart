import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenWidget extends StatefulWidget {
  @override
  _SplashScreenWidgetState createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      //navigateAfterSeconds: HomePage(),
      loaderColor: Colors.red,
      backgroundColor: Colors.yellow,
      seconds: 1,
    );
  }
}
