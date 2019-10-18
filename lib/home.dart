import 'package:augarde_showroom/card.dart';
import 'package:augarde_showroom/models/product.dart';
import 'package:augarde_showroom/services/webservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: InkWell(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1.6,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: <Widget>[
                          Image.asset('assets/others/IMG-20190910-WA0006.jpg',
                          fit: BoxFit.fill),
                          Container(
                          child: Align(
                            child: Text('NOUVEAUTÉS',
                              style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            alignment: FractionalOffset.bottomLeft,
                          ),
                            margin: EdgeInsets.only(left: 10),
                          ),
                        ],
                      );
                    },
                    itemCount: 10,
                    viewportFraction: 1,
                    scale: 0.9,
                    autoplay: true,
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 5),
                  padding: EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width,
                  // Access width of the parent
                  child: Text('Products',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FutureBuilder(
                    future: WebService().load(Product.all),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return CustomCard(product: snapshot.data[index],);
                          },
                          itemCount: snapshot.data.length,
                          viewportFraction: 0.5,
                          scale: 0.7,
                        );
                      }
                      return CircularProgressIndicator();
                    },
                  )
                ),
                Container(
                    color: Colors.transparent,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 5),
                    padding: EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width,
                    child: Text('Raffles', style: TextStyle(fontSize: 25, color: Colors.black))),
                Expanded(
                  flex: 1,
                  child: new Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: <Widget>[
                          Image.asset('assets/others/IMG-20190902-WA0033.jpg',
                              fit: BoxFit.fitWidth),
                          Container(
                            child: Align(
                              child: Text('AUGARDE 500',
                                style: TextStyle(
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              alignment: FractionalOffset.bottomLeft,
                            ),
                            margin: EdgeInsets.only(left: 10),
                          ),
                        ],
                        fit: StackFit.expand,
                      );
                    },
                    itemCount: 10,
                    autoplay: true,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
