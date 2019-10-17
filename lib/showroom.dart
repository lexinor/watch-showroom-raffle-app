import 'package:augarde_showroom/main.dart';
import 'package:augarde_showroom/raffle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Showroom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text("Bloc 1")
            ],
          ),
          Column(
            children: <Widget>[
              Text("Bloc 2")
            ],
          )
        ],
      ),
    );
  }
}
