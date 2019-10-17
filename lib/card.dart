import 'package:augarde_showroom/card_detail.dart';
import 'package:augarde_showroom/models/product.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final Product product;
  CustomCard({this.product});

  @override
  _CustomCardState createState() => _CustomCardState(product: product);
}

class _CustomCardState extends State<CustomCard> {
  final Product product;
  _CustomCardState({this.product});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
//          children: <Widget>[
//            new ListTile(
//              leading: Image.network(
//                "https://n3.sdlcdn.com/imgs/e/v/o/SDL044502225_1-6ee47.jpg",
//                fit: BoxFit.fill,
//              ),
//              title: Text('Montre 1'),
//              subtitle: Text('Petite description de la montre'),
//              onTap: onCardTap,
//            ),
//          ],
        children: <Widget>[
          new ListTile(
                  leading: Image.network(
                    product.image,
                    fit: BoxFit.fill,
                    ),
                  title: Text(product.name),
                  subtitle: Text(product.price.toString() + '€'),
                )
        ],
        ),
      ),
    );
  }
  void onCardTap(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => CardDetail()));
  }
}

