import 'package:earthquake_app/model/api.dart';
import 'package:earthquake_app/model/earthquake.dart';
import 'package:earthquake_app/model/network.dart';
import 'package:earthquake_app/model/network_new.dart';
import 'package:earthquake_app/ui/earthquake_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //fetchData(http.Client());
    return Scaffold(
        appBar: AppBar(
          title: Text("Title"),
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data["result"].length,
                      itemBuilder: (context, index) {
                        //Earthquake eq = snapshot.data["result"][index];
                        return Column(
                          children: [
                            Text(snapshot.data["result"][index].toString()),
                            Divider(
                              height: 200,
                            )
                          ],
                        );
                      })
                  : Container(child: CircularProgressIndicator());
            }));
  }
}
