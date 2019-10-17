
import 'package:augarde_showroom/models/bracelet.dart';
import 'package:augarde_showroom/models/cadran.dart';
import 'package:augarde_showroom/services/webservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:url_launcher/url_launcher.dart';

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
            child: FutureBuilder (
              future: WebService().load(Bracelet.all),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return new Image.network(
                        snapshot.data[index].image,
                        fit: BoxFit.fitHeight,
                        colorBlendMode: BlendMode.difference,
                      );
                    },
                    itemCount: snapshot.data.length,
                    viewportFraction: 0.4,
                    scale: 0.7,
                  );
                }
                return CircularProgressIndicator();
              },
            )
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3.45,
            left: MediaQuery.of(context).size.width / 2.63,
            child: Container(
              child: Image.asset(
                "assets/cadrans/cadran.png",
                height: 122,
                width: 107,
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
              child: FutureBuilder (
                future: WebService().load(Cadran.all),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return new Image.network(
                          snapshot.data[index].image,
                          fit: BoxFit.scaleDown,
                          colorBlendMode: BlendMode.difference,
                        );
                      },
                      itemCount: snapshot.data.length,
                      viewportFraction: 0.4,
                      scale: 0.7,
                    );
                  }
                  return CircularProgressIndicator();
                },
              )



//              Swiper(
//                itemBuilder: (BuildContext context, int index) {
//                  return new Image.asset(
//                    "assets/cadrans/cadran_red_white.png",
//                    fit: BoxFit.scaleDown,
//                    colorBlendMode: BlendMode.difference,
//                  );
//                },
//                itemCount: 10,
//              ),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 1,
            child: RaisedButton(
              onPressed: _launchURL,
              child: Text("Ajouter au panier"),
              color: Colors.black,
              textColor: Colors.white,
              hoverColor: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  _launchURL() async {
    const url = 'https://www.augarde.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}


