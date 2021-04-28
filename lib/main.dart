import 'package:earthquake_app/model/earthquake.dart';
import 'package:earthquake_app/ui/details_screen.dart';
import 'package:earthquake_app/ui/home_page.dart';
import 'package:earthquake_app/ui/map_screen.dart';
import 'package:earthquake_app/ui/splash_screen.dart';
import 'package:flutter/material.dart';

import 'model/marker.dart';

void main() {

  //Markers obj = new Markers();
  //List<Earthquake> hihi = obj.addData();

  //for(int j = 0; j < 5; j++){
  //  debugPrint(hihi[j].title);
  //}

  runApp(new MaterialApp(
    home: SplashScreenWidget(),
    title: "Son Depremler",
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    routes: {
      "/home_page": (context) => HomePage(),
      "/details_screen": (context) => DetailsScreen(),
      "/map_screen": (context) => MapScreen()
    },
  ));
}
