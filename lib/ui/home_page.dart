import 'package:earthquake_app/model/network.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future data;
  @override
  Widget build(BuildContext context) {
    data = getData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData)
                  return Column(
                    children: [
                      Text(snapshot.data["result"][0]["title"].toString())
                    ],
                  );
              }),
        ),
      ),
    );
  }
}
