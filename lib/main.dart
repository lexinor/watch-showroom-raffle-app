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
        backgroundColor: Colors.indigoAccent,
      ),
      body: Column(
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
            child: Text('Produits'.toUpperCase(),style: TextStyle(
              fontSize: 25,
            ),),
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
          ),
          Container(
            color: Colors.indigoAccent,
          margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
            child: Text('Raffles en cours',style: TextStyle(
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
      ),
      bottomNavigationBar: BottomNav(),
      );
  }
}


/// Bottom Navigation Widget
class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      fixedColor: Colors.indigoAccent,
      items: const <BottomNavigationBarItem>[ BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
        BottomNavigationBarItem(icon: Icon(Icons.business), title: Text("Showroom"))],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}


