import 'package:augarde_showroom/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: new Swiper(
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                "https://n3.sdlcdn.com/imgs/e/v/o/SDL044502225_1-6ee47.jpg",
                fit: BoxFit.scaleDown,
              );
            },
            itemCount: 10,
            viewportFraction: 0.8,
            scale: 0.9,
          ),
        ),
        Container(
          color: Colors.indigoAccent,
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width, // Access width of the parent
          child: Container(width: MediaQuery.of(context).size.width, color: Colors.pink ,child: Text('Products'.toUpperCase(),style: TextStyle(
            fontSize: 25,
          ),)),
        ),
        Expanded(
          child: new Swiper(
            itemBuilder: (BuildContext context, int index) {
              return CardProduct(

              );
            },
            itemCount: 10,
            viewportFraction: 0.8,
            scale: 0.9,
          ),
        ),
        Container(
            color: Colors.indigoAccent,
            margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
            child: Text('Raffles',style: TextStyle(
                fontSize: 25))
        ),
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
        )
      ],
    );
  }
}
