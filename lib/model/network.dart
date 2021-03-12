import 'dart:convert';
import 'package:http/http.dart';

// Network Class to Get Data as a decoded JSon data from API URL

class Network {
  final String url;

  Network(this.url);

  Future fetchData() async {
    Response response = await get(Uri.encodeFull(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}

Future getData() async {
  var data;
  String url = "https://api.orhanaydogdu.com.tr/deprem/live.php?limit=5";
  Network network = Network(url);
  data = network.fetchData();
  data.then((value) {
    //print(value["USD"]["Buying"]);
  });

  return data;
}
