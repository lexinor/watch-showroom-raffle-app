import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() => runApp(MaterialApp(
    home: Home()

));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Augarde Showroom", style: TextStyle(
          fontSize: 25.0 ),
        ),
        centerTitle: true ,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: new Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.network(
                  "http://via.placeholder.com/288x188",
                  fit: BoxFit.fill,
                );
              },
              itemCount: 10,
              viewportFraction: 0.8,
              scale: 0.9,
            ),
          ),
          Expanded(
            child: Text("Produits"),
          ),

          Expanded(
            child: new Swiper(
                layout: SwiperLayout.CUSTOM,
                customLayoutOption: new CustomLayoutOption(
                    startIndex: -1,
                    stateCount: 3
                ).addRotate([
                  -45.0/180,
                  0.0,
                  45.0/180
                ]).addTranslate([
                  new Offset(370.0, 0),
                  new Offset(0.0, 0.0),
                  new Offset(-370.0, 0)
                ]),
                itemWidth: 300.0,
                itemHeight: 200.0,
                itemBuilder: (context, index) {
                  return new Container(
                    color: Colors.grey,
                    child: new Center(
                      child: new Text("$index"),
                    ),
                  );
                },
                itemCount: 10),
          )
        ],
      ),
      );
  }
}