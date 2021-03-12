import 'dart:convert';

import 'package:earthquake_app/model/earthquake.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Earthquake>> fetchData(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseData, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Earthquake> parseData(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Earthquake>((json) => Earthquake.fromJson(json)).toList();
}
