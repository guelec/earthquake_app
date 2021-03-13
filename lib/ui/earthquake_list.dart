import 'package:earthquake_app/model/earthquake.dart';
import 'package:flutter/material.dart';

class EarthquakeList extends StatefulWidget {
  final List<Earthquake> data;

  EarthquakeList({Key key, @required this.data}) : super(key: key);
  @override
  _EarthquakeListState createState() => _EarthquakeListState(data);
}

class _EarthquakeListState extends State<EarthquakeList> {
  List<Earthquake> data;

  _EarthquakeListState(this.data);

  @override
  Widget build(BuildContext context) {
    //print(data);
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Text(data[index].title);
      },
    );
  }
}
