import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Raffle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Image.asset("assets/others/IMG-20190902-WA0034.jpg",
              width: 200,
              height: 200,
              fit: BoxFit.fitWidth,
            ),
            Container(
              color: Colors.transparent,
              margin: EdgeInsets.fromLTRB(0, 20, 0, 5),
              padding: EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              // Access width of the parent
              child: Text('Limité au secteur suivant : ',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
