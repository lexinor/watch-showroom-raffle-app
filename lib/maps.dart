import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
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
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.transparent,
            margin: EdgeInsets.fromLTRB(0, 20, 0, 5),
            padding: EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width,
            // Access width of the parent
            child: Text('Raffle',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          Expanded(
            child:  Image.asset('assets/others/IMG-20190905-WA0006.jpg'),
          ),
          Container(
            color: Colors.transparent,
            margin: EdgeInsets.fromLTRB(0, 20, 0, 5),
            padding: EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width,
            // Access width of the parent
            child: Text('Products',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300, //MediaQuery.of(context).size.width / 2
            child: userLocation == null ? GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(48.8491485,2.3874704), zoom: 17.0),
              onMapCreated: mapCreated,
            ): GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(userLocation.latitude, userLocation.longitude), zoom: 17.0),
                onMapCreated: mapCreated,
                markers: {
                  Marker(
                    markerId: MarkerId('You'),
                    position: LatLng(userLocation.latitude, userLocation.longitude),
                    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                  )
                }
            ),
          ),
          Container(
            child: MaterialButton(
              textColor: Colors.black,
              child: Text("QR CODE"),
            ),
          )
        ],
      ),
    );
  }

  void mapCreated(controller){
    setState(() {
      _controller = controller;
    });
  }

  Future<GeolocationStatus> _checkStatus() async{
    GeolocationStatus geolocationStatus  = await Geolocator().checkGeolocationPermissionStatus();

    return geolocationStatus;
  }

  Future<Position> _getLocation() async {
    var currentLocation;
    try{
      currentLocation = await geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    }
    catch(e){
      currentLocation = null;
    }
    return currentLocation;
  }

  void initState() {
    // TODO: implement initState
    super.initState();

    _checkStatus().then((status) {
      debugPrint('--------------------------------------------------------- Geolication Status : ${status}');
    });

    _getLocation().then((position) {
      userLocation = position;
      debugPrint('--------------------------------------------------------- userLocation : ${position}');

    });
  }
}
