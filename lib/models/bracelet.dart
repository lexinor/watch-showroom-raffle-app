import 'package:augarde_showroom/constants.dart';
import 'package:augarde_showroom/services/webservice.dart';
import 'dart:convert';

class Bracelet {
  final int id;
  final String name;
  final String image;

  Bracelet({this.id, this.name, this.image});

  factory Bracelet.fromJson(Map<String, dynamic> json) {
    return Bracelet(
      id: json['id'],
      name: json['name'],
      image: json['image']
    );
  }

  static Resource<List<Bracelet>> get all {
    return Resource(
        url: Uri.https(Constants.URL, "/product/bracelet/all").toString(),
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result;
          return list.map((model) => Bracelet.fromJson(model)).toList();
        }
    );
  }
}