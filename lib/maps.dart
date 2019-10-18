import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';


class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  GoogleMapController _controller;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300, //MediaQuery.of(context).size.width / 2
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(48.882183, 2.366478), zoom: 15.0),
        onMapCreated: mapCreated,
      ),
    );
  }

  void mapCreated(controller){
    setState(() {
      _controller = controller;
    });
  }

  Future<GeolocationStatus> checkStatus() async{
    GeolocationStatus geolocationStatus  = await Geolocator().checkGeolocationPermissionStatus();

    return geolocationStatus;
  }
}
