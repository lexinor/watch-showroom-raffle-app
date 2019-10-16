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
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
        BottomNavigationBarItem(icon: Icon(Icons.business), title: Text("Raffles")),
        BottomNavigationBarItem(icon: Icon(Icons.slideshow), title: Text("Showroom"))],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch(_selectedIndex) {
        case 0: {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        }
        break;

        case 1: {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Raffle()));
        }
        break;

        default: {

        }
        break;
      }

    });
  }
}
