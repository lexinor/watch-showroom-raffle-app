import 'package:augarde_showroom/main.dart';
import 'package:augarde_showroom/showroom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Raffle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Test");
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

        case 2: {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Showroom()));
        }
        break;

        default: {

        }
        break;
      }

    });
  }
}