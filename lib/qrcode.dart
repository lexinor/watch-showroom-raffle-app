import 'package:flutter/material.dart';

class InfoQR extends StatefulWidget {
  @override
  _InfoQRState createState() => _InfoQRState();
}

class _InfoQRState extends State<InfoQR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Raffle share",
          style: TextStyle(color: Colors.white, fontSize: 25.0),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Text("AUGARDE 500", style: TextStyle( fontSize: 28),),
          ),
          Container(
            child: Text("Inscription Validée"),
          ),
          Container(
            child: Text("Voici votre QR code de partage"),
          ),
          Container(
            child: Image.asset('assets/others/qr_code.png'),
          ),
          MaterialButton(
            textColor: Colors.black,
            child: Text("Partager par lien"),
          )
        ],
      ),
    );
  }
}
