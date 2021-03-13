import 'package:earthquake_app/model/earthquake.dart';

class Api {
  final bool status;
  final List<Earthquake> result;

  Api({this.status, this.result});

  factory Api.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['result'] as List;
    print(list.runtimeType);
    List<Earthquake> resultList =
        list.map((i) => Earthquake.fromJson(i)).toList();

    return Api(status: parsedJson['status'], result: resultList);
  }
}
