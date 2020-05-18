import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class Sendlocation extends StatefulWidget {
  @override
  _SendlocationState createState() => _SendlocationState();
}

class _SendlocationState extends State<Sendlocation> {
  final database="database";
  final lat = "latitude";
  final lon = "longitude";
  final address = "address";
  final loc = "location";
  final mobileno = "mobileno";
  final userid = "userid";
  final ref = FirebaseDatabase.instance.reference();

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  String _currentAddress;

  String phoneNumber = "";
  String uid = "";
  getuidandmbno() {}
  @override
  void initState() {
    this.uid = ' ';
    this.phoneNumber = ' ';
    FirebaseAuth.instance.currentUser().then((val) {
      setState(() {
        this.uid = val.uid;
        this.phoneNumber = val.phoneNumber;
      });
    }).catchError((e) {
      print(e);
    });
    super.initState();
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  showAlert(BuildContext context) {

    // for time stamp
    var now = new DateTime.now();
    var datestamp = new DateFormat("yyyyMMdd'T'HHmmss");
    String currentdate = datestamp.format(now);
    // ends here
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure you want to send your location ?'),
          actions: <Widget>[
            FlatButton(
              child: Text('YES',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              onPressed: () {
                var now = new DateTime.now();
                var datestamp = new DateFormat("yyyyMMdd'T'HHmmss");
                String currentdate = datestamp.format(now);
                //Put your code here which you want to execute on Yes button click.
                _getCurrentLocation();
                // after adding function of fetching UID add one more child of UID right after child(loc)
                ref
                    .child(database)
                    .child(uid+currentdate)
                    .child(lat)
                    .set(_currentPosition.latitude);
                ref
                    .child(database)
                    .child(uid+currentdate)
                    .child(lon)
                    .set(_currentPosition.longitude);
                ref
                    .child(database)
                    .child(uid+currentdate)
                    .child(address)
                    .set(_currentAddress);
                ref.child(database).child(uid + currentdate).child(mobileno).set(phoneNumber);
                ref.child(database).child(uid + currentdate).child(userid).set(uid);

                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('NO',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              onPressed: () {
                //Put your code here which you want to execute on No button click.
                Navigator.of(context).pop();
              },
            ),
          ],
          elevation: 24.0,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_currentPosition != null)
              Text(
                  "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}"),
            if (_currentPosition != null) Text(_currentAddress),
            FlatButton(
                onPressed: () {
                  // _getCurrentLocation();
                  showAlert(context);
                },
                color: Colors.green,
                child: Text("Send Location"))
          ]),
    ));
  }
}