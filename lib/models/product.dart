import 'package:augarde_showroom/constants.dart';
import 'package:augarde_showroom/services/webservice.dart';
import 'dart:convert';

class Product {
  final int id;
  final double price;
  final String name;
  final String description;
  final String image;

  Product({this.id, this.price, this.name, this.description, this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      price: double.parse(json['price']),
      name: json['name'],
      description: json['description'],
      image: json['image']
    );
  }

  static Resource<List<Product>> get all {
    return Resource(
      url: Uri.https(Constants.URL, "/product/watch/all").toString(),
      parse: (response) {
        final result = json.decode(response.body);
        Iterable list = result;
        return list.map((model) => Product.fromJson(model)).toList();
      }
    );
  }
}