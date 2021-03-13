import 'dart:convert';

import 'package:earthquake_app/model/earthquake.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Earthquake>> fetchData(http.Client client) async {
  final response = await client.get(
      Uri.parse('https://api.orhanaydogdu.com.tr/deprem/live.php?limit=5'));
  //print(response.body);
  // Use the compute function to run parsePhotos in a separate isolate.

  return compute(parseData, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Earthquake> parseData(String responseBody) {
  var parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  //debugPrint(parsed.toString());
  parsed = parsed["result"];
  return parsed.map<Earthquake>((json) => Earthquake.fromJson(json)).toList();
}
