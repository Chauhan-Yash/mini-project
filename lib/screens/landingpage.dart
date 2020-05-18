import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class Mappage extends StatefulWidget {
  @override
  _MappageState createState() => _MappageState();
}

class _MappageState extends State<Mappage> {
  GoogleMapController mapController;
Set<Marker> _markers = {};

  
 static LatLng latlng;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
     setState(() {
         _markers.add(
            Marker(
               markerId: MarkerId('<MARKER_ID>'),
               position: latlng,
              
            )
         );
      });
  }
  Future <void> getLocation() async{
    await Geolocator()
     .getCurrentPosition(desiredAccuracy:LocationAccuracy.high)
     .then((Position _position)
     {
       if(_position!=null){
         setState(() {
           latlng=LatLng(_position.latitude,_position.longitude);
         });
       }
     });
  }
  @override
  void initState(){
    super.initState();
    getLocation();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    
        body: GoogleMap(
          markers: _markers,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target:latlng,
            zoom: 16.0,
          ),
        ),
      
    );
  }
}