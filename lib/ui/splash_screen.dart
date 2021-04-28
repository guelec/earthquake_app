import 'package:earthquake_app/ui/earthquake_list.dart';
import 'package:earthquake_app/ui/home_page.dart';
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
      navigateAfterSeconds: HomePage(),
      //loaderColor: Colors.black,
      backgroundColor: Colors.greenAccent,
      seconds: 1,
    );
  }
}
