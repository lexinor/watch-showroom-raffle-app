import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => new _UserPageState();
}

class _UserPageState extends State<UserPage> {

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return new Stack(children: <Widget>[
      new Container(color: Colors.white,),
      //new Image.network(imgUrl, fit: BoxFit.fill,),
      new Scaffold(
          drawer: new Drawer(child: new Container(),),
          backgroundColor: Colors.transparent,
          body: new Center(
            child: new Column(
              children: <Widget>[
                new SizedBox(height: _height/12,),
                new CircleAvatar(radius:_width<_height? _width/4:_height/4,backgroundImage: AssetImage('assets/others/outline_account_circle_black_48dp.png'), backgroundColor: Colors.transparent,),
                new SizedBox(height: _height/25.0,),
                new Text('Henry Dupont', style: new TextStyle(fontWeight: FontWeight.bold, fontSize: _width/15, color: Colors.black),),
//                new Padding(padding: new EdgeInsets.only(top: _height/30, left: _width/8, right: _width/8),
//                  child:new Text('Snowboarder, Superhero and writer.\nSometime I work at google as Executive Chairman ',
//                    style: new TextStyle(fontWeight: FontWeight.normal, fontSize: _width/25,color: Colors.black),textAlign: TextAlign.center,) ,),
                new Divider(height: _height/30,color: Colors.grey,),
                new Row(
                  children: <Widget>[
//                    rowCell(343, 'POSTS'),
//                    rowCell(673826, 'FOLLOWERS'),
//                    rowCell(275, 'FOLLOWING'),
                    Container(
                      child: Align(
                        child: Text('Orders',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        alignment: FractionalOffset.bottomLeft,
                      ),
                      margin: EdgeInsets.only(left: 10),
                    ),
                  ],),
                new Divider(height: _height/30,color: Colors.grey),
                new Row(
                  children: <Widget>[
//                    rowCell(343, 'POSTS'),
//                    rowCell(673826, 'FOLLOWERS'),
//                    rowCell(275, 'FOLLOWING'),
                    Container(
                      child: Align(
                        child: Text('Inbox',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        alignment: FractionalOffset.bottomLeft,
                      ),
                      margin: EdgeInsets.only(left: 10),
                    ),
                  ],),
                new Divider(height: _height/30,color: Colors.grey),
                new Row(
                  children: <Widget>[
//                    rowCell(343, 'POSTS'),
//                    rowCell(673826, 'FOLLOWERS'),
//                    rowCell(275, 'FOLLOWING'),
                    Container(
                      child: Align(
                        child: Text('Raffle +',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        alignment: FractionalOffset.bottomLeft,
                      ),
                      margin: EdgeInsets.only(left: 10),
                    ),
                  ],),
                new Divider(height: _height/30,color: Colors.grey),
                new Row(
                  children: <Widget>[
//                    rowCell(343, 'POSTS'),
//                    rowCell(673826, 'FOLLOWERS'),
//                    rowCell(275, 'FOLLOWING'),
                    Container(
                      child: Align(
                        child: Text('Settings',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        alignment: FractionalOffset.bottomLeft,
                      ),
                      margin: EdgeInsets.only(left: 10),
                    ),
                  ],),
                new Divider(height: _height/30,color: Colors.grey),
              ],
            ),
          )
      )
    ],);
  }

  Widget rowCell(int count, String type) => new Expanded(child: new Column(children: <Widget>[
    new Text('$count',style: new TextStyle(color: Colors.black),),
    new Text(type,style: new TextStyle(color: Colors.black, fontWeight: FontWeight.normal))
  ],));
}