import 'dart:collection';
import 'dart:core';
import 'package:earthquake_app/model/earthquake.dart';
import 'package:earthquake_app/model/network_new.dart';

class Markers{
  Future markerLocations;
  // ignore: deprecated_member_use
  List<Earthquake> eqList = List<Earthquake>();

  Markers(){
    markerLocations = getData();
  }

  List<Earthquake> addData(){

    var actualList = markerLocations.then((value){
      //list = List.generate(value["result"].length, (index) => value["result"][index]);
      //print(value["result"][0]);
      for(int i = 0; i < value["result"].length; i++){
        value["result"][i]["mag"] = value["result"][i]["mag"] / 1.0;
        value["result"][i]["depth"] = value["result"][i]["depth"] / 1.0;
        value["result"][i]["loc"].toString();
        Earthquake obj = new Earthquake.name(value["result"][i]["mag"], value["result"][i]["lng"],
            value["result"][i]["lat"], value["result"][i]["loc"], double.parse(value["result"][i]["depth"].toString()),
            value["result"][i]["coordinates"].toString(), value["result"][i]["title"], value["result"][i]["rev"],
            value["result"][i]["timestamp"].toString(), value["result"][i]["date_stamp"].toString(), value["result"][i]["date"],
            value["result"][i]["hash"], value["result"][i]["hash2"]);
        this.eqList.add(obj);
      }
      return eqList;
    }

    );
  }
}


/*
Future markerLocations = getData();
List<LinkedHashMap> xxxlist;

Future<List> getEarthquakeList() async{

  await markerLocations.then((value)  => FutureBuilder (
      future: getData(),
      builder: (context, snapshot)  {
         return snapshot.hasData
            ? List.generate(value["result"].length, (index) => value["result"][index]
        )
        : Text("Loading");
      }
  ));
}
*/

