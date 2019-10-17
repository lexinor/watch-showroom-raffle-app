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
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        //child: Image.network(product.image),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
        child: Column(
          //mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Image.network(product.image,
              fit: BoxFit.fill,
            height: 100,
          ),
          ListTile(
//                  leading: Image.network(
//                    product.image,
//                    fit: BoxFit.fitWidth,
//                    alignment: Alignment.topCenter,
//                    ),
                  title: Text(product.name),
                  subtitle: Text(product.price.toString() + '€'),
                  onTap: onCardTap,
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

