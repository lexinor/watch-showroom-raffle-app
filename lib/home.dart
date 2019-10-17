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
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: new Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return new Image.network(
                        "https://n3.sdlcdn.com/imgs/e/v/o/SDL044502225_1-6ee47.jpg",
                        fit: BoxFit.contain,
                      );
                    },
                    itemCount: 10,
                    viewportFraction: 0.8,
                    scale: 0.9,
                    autoplay: true,
                  ),
                ),
                Container(
                  color: Colors.indigoAccent,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(20.0),
                  width: MediaQuery.of(context).size.width,
                  // Access width of the parent
                  child: Text('Products',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: WebService().load(Product.all),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return CustomCard(product: snapshot.data[index],);
                          },
                          itemCount: snapshot.data.length,
                          viewportFraction: 0.8,
                          scale: 0.9,
                        );
                      }
                      return CircularProgressIndicator();
                    },
                  )
//                  new Swiper(
//                    itemBuilder: (BuildContext context, int index) {
//                      return CustomCard(product: products[index],);
//                    },
//                    itemCount: products.length,
//                    viewportFraction: 0.8,
//                    scale: 0.9,
//                  ),
                ),
                Container(
                    color: Colors.indigoAccent,
                    margin: EdgeInsets.all(20.0),
                    padding: EdgeInsets.all(20.0),
                    width: MediaQuery.of(context).size.width,
                    child: Text('Raffles', style: TextStyle(fontSize: 25))),
                Expanded(
                  child: new Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return new Image.network(
                        "http://via.placeholder.com/288x188",
                        fit: BoxFit.fitWidth,
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
