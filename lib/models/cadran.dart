import 'package:watchshowroomapp/constants.dart';
import 'package:watchshowroomapp/services/webservice.dart';
import 'dart:convert';

class Cadran {
  final int id;
  final String name;
  final String image;

  Cadran({this.id, this.name, this.image});

  factory Cadran.fromJson(Map<String, dynamic> json) {
    return Cadran(
      id: json['id'],
      name: json['name'],
      image: json['image']
    );
  }

  static Resource<List<Cadran>> get all {
    return Resource(
        url: Uri.https(Constants.URL, "/product/cadran/all").toString(),
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result;
          return list.map((model) => Cadran.fromJson(model)).toList();
        }
    );
  }
}