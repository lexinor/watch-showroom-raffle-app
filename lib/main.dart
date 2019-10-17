import 'package:augarde_showroom/card_detail.dart';
import 'package:augarde_showroom/home.dart';
import 'package:augarde_showroom/raffle.dart';
import 'package:augarde_showroom/showroom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(
        home: Home(),
        theme: ThemeData(accentColor: Colors.black),

    ));

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();

}

class HomeState extends State<Home>{
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Augarde Showroom", style: TextStyle(
            color: Colors.black,
            fontSize: 25.0),
        ),
        backgroundColor: Colors.white,
      ),
      body: _onItemTapped(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        fixedColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text("Raffles")),
          BottomNavigationBarItem(
              icon: Icon(Icons.slideshow), title: Text("Showroom"))
        ],
      ),
    );
  }

  Widget _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch(_selectedIndex) {
      case 1: {
        return Raffle();
      }
      break;

      case 2: {
        return Showroom();
      }
      break;

      default: {
        return HomeBody();
      }
      break;
    }
  }
}






