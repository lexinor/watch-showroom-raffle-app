import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:augarde_showroom/qrcode.dart';


class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  GoogleMapController _controller;

  Geolocator geolocator = Geolocator();

  Position userLocation = null;

  // ESGI : 48.8491485,2.3874704


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: InkWell(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height * 1.6,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: Colors.transparent,
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 5),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  // Access width of the parent
                  child: Text('Raffle',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: Image.asset('assets/others/IMG-20190905-WA0006.jpg'),
                ),
                Container(
                  color: Colors.transparent,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  // Access width of the parent
                  child: Text("Limité au secteur de l'ESGI",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 300, //MediaQuery.of(context).size.width / 2
                  child: userLocation == null ? GoogleMap(
                    initialCameraPosition: CameraPosition(
                        target: LatLng(48.8491485, 2.3874704), zoom: 17.0),
                    onMapCreated: mapCreated,
                  ) : GoogleMap(
                      initialCameraPosition: CameraPosition(
                          target: LatLng(userLocation.latitude, userLocation
                              .longitude), zoom: 17.0),
                      onMapCreated: mapCreated,
                      markers: {
                        Marker(
                          markerId: MarkerId('You'),
                          position: LatLng(
                              48.8491485,2.3874704),
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueRed),
                        )
                      }
                  ),
                ),
                Container(
                  color: Colors.black,
                  margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                  width: MediaQuery.of(context).size.width,
                  child: MaterialButton(
                    textColor: Colors.white,
                    child: Text("Participer"),
                    onPressed: createQR,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  Future<GeolocationStatus> _checkStatus() async {
    GeolocationStatus geolocationStatus = await Geolocator()
        .checkGeolocationPermissionStatus();

    return geolocationStatus;
  }

  Future<Position> _getLocation() async {
    var currentLocation;
    try {
      currentLocation = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    }
    catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

  void initState() {
    super.initState();

    _checkStatus().then((status) {
      debugPrint(
          '--------------------------------------------------------- Geolication Status : ${status}');
    });

    _getLocation().then((position) {
      userLocation = position;
      debugPrint(
          '--------------------------------------------------------- userLocation : ${position}');
    });
  }

  void createQR(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => InfoQR()));
  }




}


