
import 'package:earthquake_app/model/network_new.dart';
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
                        return cardDesign(snapshot.data["result"][index]);
                        /*
                          Column(
                          children: [
                            Text(snapshot.data["result"][index].toString()),
                            Divider(
                              height: 200,
                            )
                          ],
                        );
                        */
                      })
                  : Container(child: CircularProgressIndicator());
            }));
  }
  Widget cardDesign(data){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(20)
        ),
        height: MediaQuery.of(context).size.height * 0.20,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: (){
              debugPrint("tap");
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.blueGrey),

                child: Row(

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(300),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.width * 0.15,
                          color: Colors.amberAccent,
                          child: Center(child: Text(data["mag"].toString())),
                        ),
                      ),
                    ),
                    VerticalDivider(width: MediaQuery.of(context).size.width * 0.05, color: Colors.transparent,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(data["lokasyon"].toString()),
                        Text(data["date"].toString()),
                        Text(data["depth"].toString()+" KMm"),
                        Text("Hey Soul Sister"),
                        Text("deneme")],

                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
