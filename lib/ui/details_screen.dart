import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart" as latLng;
import 'package:intl/intl.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailsScreen extends StatefulWidget {
  final data;

  const DetailsScreen({Key key, this.data}) : super(key: key);
  @override
  _DetailsScreenState createState() => _DetailsScreenState(this.data);
}

class _DetailsScreenState extends State<DetailsScreen> {
  final dynamic data;

  _DetailsScreenState(this.data);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: [
                mapView(w, h),
                detailsView(w, h)
              ],
            ),
          ),
        )
      )
    );

  }
  String convertTimeStampToHumanHour(int timeStamp) {
    var dateToTimeStamp = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    return DateFormat('HH:mm').format(dateToTimeStamp);
  }

  Widget detailsView(w, h){
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(45),
        child: Container(
          width: w * 0.8,
          height: w * 0.5,
          decoration: BoxDecoration(
            color: Colors.white24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(child: Text(data["title"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,), overflow: TextOverflow.visible, maxLines: 2, softWrap: true,)),
              ),
              Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                ClipRRect(borderRadius: BorderRadius.circular(30), child: Container(
                  width: w * 0.2,
                  height: w * 0.2,
                  color: Colors.black45,
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly , children: [Icon(Icons.access_time_outlined), Text(convertTimeStampToHumanHour(data["timestamp"]))],),
                ),),
                ClipRRect(borderRadius: BorderRadius.circular(30), child: Container(
                  width: w * 0.2,
                  height: w * 0.2,
                  color: Colors.black45,
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly ,children: [Icon(Icons.wifi_tethering_outlined), Text(data["depth"].toString())],),
                ),),
                ClipRRect(borderRadius: BorderRadius.circular(30), child: Container(
                  width: w * 0.2,
                  height: w * 0.2,
                  color: Colors.black45,
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly , children: [Icon(Icons.waves_outlined), Text(data["mag"].toString())],),
                ),),

              ],)
                  //"\n" + data["depth"].toString() + "\n" + data["mag"].toString() + "\n" +  convertTimeStampToHumanHour(data["timestamp"]))
            ],
          ),
        ),
      ),
    );
  }

  Widget mapView(w, h){
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Container(
          width: w * 0.8,
          height: w * 0.8,
          child: FlutterMap(
            options: MapOptions(
            center: latLng.LatLng
              (data["lat"], data["lng"]),
            zoom: 7.0,
          ),
              layers: [
                TileLayerOptions(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],

                ),
                MarkerLayerOptions(
                  markers: [Marker(width: w * 0.25, height: w * 0.25, point: latLng.LatLng(data["lat"], data["lng"]),builder: (context) => Container(
                    width: w * 0.2,
                    height: w * 0.2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red.withOpacity(0.5)
                    ),
                  )) ]
                  ,
                ),
              ]),
        ),
      ),
    );
  }
}
