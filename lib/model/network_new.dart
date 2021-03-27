import 'dart:convert';
import 'package:http/http.dart' as http;

// Network Class to Get Data as a decoded JSon data from API URL

class NetworkNew {
  final String url;

  NetworkNew(this.url);

  Future fetchData() async {
    //Response response = await get(Uri.encodeFull(uri));
    //final response = await http.get(Uri.toUri(url)));

    final response = await http.get(Uri.tryParse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}

Future getData() async {
  var data;
  String url = "https://api.orhanaydogdu.com.tr/deprem/live.php?limit=20";
  NetworkNew network = NetworkNew(url);
  data = network.fetchData();
  data.then((value) {
    //print(value);
  });
  return data;
}
