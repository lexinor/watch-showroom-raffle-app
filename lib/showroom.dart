import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Showroom extends StatefulWidget {
  @override
  _ShowroomState createState() => _ShowroomState();
}

class _ShowroomState extends State<Showroom> {
  @override
  Widget build(BuildContext context) {
    //getAllBracelets();
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.asset(
                  "assets/bracelets/bracelet_big.png",
                  fit: BoxFit.scaleDown,
                );
              },
              itemCount: 10,
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Image.asset(
                    "assets/cadrans/cadran_red_white.png",
                    fit: BoxFit.scaleDown,
                  );
                },
                itemCount: 10,
              ),
            ),
          ),
          Center(
            child: Container(
              child: Image.asset(
                "assets/cadrans/cadran.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Image> getAllBracelets() {
    var myDir = Directory('./bracelets/');

    List<FileSystemEntity> _images =
        myDir.listSync(recursive: true, followLinks: false);
    print(_images[1]);
    List<FileImage> braceletsImg;
    /*
    for(var i = 0; i < _images.length; i++){
      braceletsImg.add(_images[i]);
    }
  */
    return null;
  }
}
