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
    return Container(
      child: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          Container(
            /// Block bracelet
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.asset(
                  "assets/bracelets/bracelet_little.png",
                  fit: BoxFit.fitHeight,
                  colorBlendMode: BlendMode.difference,
                );
              },
              itemCount: 10,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3.5,
            left: MediaQuery.of(context).size.width / 2.67,
            child: Container(
              child: Image.asset(
                "assets/cadrans/cadran.png",
                height: 122,
                width: 100,
                fit: BoxFit.contain,
                colorBlendMode: BlendMode.difference,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3.15,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 10,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Image.asset(
                    "assets/cadrans/cadran_red_white.png",
                    fit: BoxFit.scaleDown,
                    colorBlendMode: BlendMode.difference,
                  );
                },
                itemCount: 10,
              ),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 1,
            child: MaterialButton(
              onPressed: () {},
              child: Text("Ajouter au panier"),
              color: Colors.indigo,
              textColor: Colors.white,
              hoverColor: Colors.indigoAccent,
            ),
          )
        ],
      ),
    );
  }

  /// Not working ATM
  List<Image> getAllBracelets() {
    var myDir = Directory('assets/cadrans/cadran.png');
    File file = new File("assets/cadrans/cadran.png");
    print(file);
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
