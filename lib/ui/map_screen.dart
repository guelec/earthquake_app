import 'package:earthquake_app/model/network_new.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart" as latLng;

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: FutureBuilder(
      future: getData(),
    builder: (context, snapshot) {
      return snapshot.hasData
          ? FlutterMap(options: MapOptions(
        center: latLng.LatLng
          (40.89, 32.87),
        zoom: 5.0,
      ),
        layers: [
          TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']
          ),
          MarkerLayerOptions(
            markers:
              List.generate(snapshot.data["result"].length, (index) => Marker(
                width: 80.0,
                height: 80.0,
                point: latLng.LatLng(snapshot.data["result"][index]["lat"], snapshot.data["result"][index]["lng"]),
                builder: (ctx) => InkWell(onTap: () => debugPrint("Hi"),
                    child: Container(child: Icon(Icons.location_on,color: Colors.red, size: 36,)))
              ))
            ,
          ),
        ],)
          : Center(child: CircularProgressIndicator());
    }
        ),
      ),
    );
  }
}
