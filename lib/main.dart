import 'package:augarde_showroom/home.dart';
import 'package:augarde_showroom/raffle.dart';
import 'package:augarde_showroom/showroom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() =>
    runApp(MaterialApp(
        home: Home()

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
            fontSize: 25.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
      ),
      body: _onItemTapped(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        fixedColor: Colors.indigoAccent,
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




class CardProduct extends StatefulWidget {
  @override
  _CardProductState createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            ButtonTheme.bar(
              // make buttons use the appropriate styles for cards
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('BUY TICKETS'),
                    onPressed: () {
                      /* ... */
                    },
                  ),
                  FlatButton(
                    child: const Text('LISTEN'),
                    onPressed: () {
                      /* ... */
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



