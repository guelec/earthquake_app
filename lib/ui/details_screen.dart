import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart" as latLng;
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: FlutterMap(
          options: MapOptions(
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
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: latLng.LatLng(51.5, -0.09),
                  builder: (ctx) =>
                      Container(
                        child: Icon(Icons.location_on_outlined,color: Colors.red, size: 36,)
                      ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
