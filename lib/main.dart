import 'package:augarde_showroom/card_detail.dart';
import 'package:augarde_showroom/home.dart';
import 'package:augarde_showroom/raffle.dart';
import 'package:augarde_showroom/showroom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            new ListTile(
              leading: Image.network(
                "https://n3.sdlcdn.com/imgs/e/v/o/SDL044502225_1-6ee47.jpg",
                fit: BoxFit.fill,
              ),
              title: Text('Montre 1'),
              subtitle: Text('Petite description de la montre'),
              onTap: onCardTap,
            ),
          ],
        ),
      ),
    );
  }
  void onCardTap(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => CardDetail()));
  }
}





