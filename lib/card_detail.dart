import 'package:flutter/material.dart';

class CardDetail extends StatefulWidget {
  @override
  _CardDetailState createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Watch detail"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Text("Detail page"),
    );
  }
}
