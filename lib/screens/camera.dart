import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:phoneflutter/screens/dashboard.dart';
import 'package:video_player/video_player.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:custom_progress_dialog/custom_progress_dialog.dart';
File _cameraVideo;

VideoPlayerController _cameraVideoPlayerController;
ProgressDialog _progressDialog = ProgressDialog();

String url;
String phoneNumber;
String uid;
String _currentAddress;
double lat;
double log;
final db="database";



class Sendvideo extends StatefulWidget {
  
  @override
  _MyvideoPageState createState() => new _MyvideoPageState();
}

class _MyvideoPageState extends State<Sendvideo> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  
  Future getVedio() async {
    File video = await ImagePicker.pickVideo(source: ImageSource.camera);
    _cameraVideo = video;
    _cameraVideoPlayerController = VideoPlayerController.file(_cameraVideo)
      ..initialize().then((_) {
        setState(() {
          _cameraVideoPlayerController.setLooping(true);
        });
        _cameraVideoPlayerController.play();
      });
  }

  @override
  void dispose() {
    super.dispose();
    _cameraVideoPlayerController.pause();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: new Center(
        child: _cameraVideo == null ? Text('Record A Video') : enableUpload(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: getVedio,
        tooltip: 'Add Vedio',
        child: new Icon(Icons.camera),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

// geo_location module
  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
       lat =_currentPosition.latitude;
       log=_currentPosition.longitude;
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


  // function for uploading video

  Widget enableUpload() {
    return Container(
      child: Column(
        children: <Widget>[
          if (_cameraVideo != null)
            _cameraVideoPlayerController.value.initialized
                ? AspectRatio(
                    aspectRatio: 100 / 80,
                    child: VideoPlayer(
                      _cameraVideoPlayerController,
                    ),
                  )
                : Container()
          else
            Text(
              "Click on Pick Video to select video",
              style: TextStyle(fontSize: 18.0),
            ),
          RaisedButton(
            elevation: 7.0,
            child: Text('Add Message'),
            textColor: Colors.white,
            color: Colors.green,
            onPressed: () {
              if (_cameraVideoPlayerController.value.isPlaying) {
                _cameraVideoPlayerController.pause();
                _getCurrentLocation();
                showAlertDialog(context);
              }
            },
          )
        ],
      ),
    );
  }
}

// controller
TextEditingController _textFieldController = TextEditingController();
// function of dialog box

showAlertDialog(BuildContext context) {
  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text('Add Message'),
    content: TextField(
      controller: _textFieldController,
      decoration: InputDecoration(hintText: "Enter here"),
    ),
    actions: <Widget>[
      new FlatButton(
        child: new Text('Add'),
        onPressed: () {
          SubPage();
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SubPage()))
              .then((result) {
            Navigator.of(context).pop();
          });
        },
      )
    ],
  );

  // show the dialog

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

// class of another page

// Future navigateToSubPage(context) async {
//   Navigator.push(context, MaterialPageRoute(builder: (context) => SubPage()));
// }
class SubPage extends StatefulWidget {
  @override
  _SubPageState createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  ProgressDialog pr;
  

  final fb = FirebaseDatabase.instance;
  final url1="url";
  final msz='msz';
  final latitude='latitude';
  final longitude='longitude';
  final mobileno="mobileno";
  final userid="userid";
  final location="location";
  final add="address";
  final database="database";

  String phoneNumber="";
  String uid="";
  getuidandmbno(){}
  @override
  void initState(){
    this.uid=' ';
    this.phoneNumber=' ';
    FirebaseAuth.instance.currentUser().then((val){
      setState(() {
       this.uid=val.uid;
       this.phoneNumber= val.phoneNumber;
      });
    }).catchError((e){
      print(e);
    });
    super.initState();
  }
 
  
  @override
  Widget build(BuildContext context) {

    pr = new ProgressDialog();
    final ref = fb.reference();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Confirmation'),
        backgroundColor: Colors.green,
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Container(
                height: 400,
                child: new Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 100 / 80,
                      child: VideoPlayer(_cameraVideoPlayerController),
                    )
                  ],
                ),
              ),
              RaisedButton(
                child: Text('Play'),
                color: Colors.green,
                onPressed: () {
                  // If the video is playing, pause it.
                  if (_cameraVideoPlayerController.value.isPlaying) {
                    _cameraVideoPlayerController.pause();
                  } else {
                    // If the video is paused, play it.
                    _cameraVideoPlayerController.play();
                  }
                },
              ),
              Spacer(),
              new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text('Message'),
                      new Text(
                        _textFieldController.text,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              RaisedButton(
                elevation: 7.0,
                child: Text('SEND'),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () async {
                  if (_cameraVideoPlayerController.value.isPlaying) {
                    _cameraVideoPlayerController.pause();
                  }

                  var now = new DateTime.now();
                  var datestamp = new DateFormat("yyyyMMdd'T'HHmmss");
                  String currentdate = datestamp.format(now);
                  final StorageReference firebaseStorageRef =
                      FirebaseStorage.instance.ref().child('$currentdate.mp3');
                  final StorageUploadTask task =
                      firebaseStorageRef.putFile(_cameraVideo);
                  _progressDialog.showProgressDialog(context,dismissAfter:null,textToBeDisplayed:'Sending...',onDismiss:(){
  //things to do after dismissing -- optional
});    
                    
                  final StorageTaskSnapshot downloadUrl =
                      (await task.onComplete);

                  final String url = (await downloadUrl.ref.getDownloadURL());

                  // I will add uid in place of db
                   ref.child(database).child(uid+currentdate).child(url1).set(url);
                   ref.child(database).child(uid+currentdate).child(msz).set( _textFieldController.text);
                   ref.child(database).child(uid+currentdate).child(latitude).set(lat);
                   ref.child(database).child(uid+currentdate).child(longitude).set(log);
                   ref.child(database).child(uid+currentdate).child(add).set(_currentAddress);
                   ref.child(database).child(uid+currentdate).child(mobileno).set(phoneNumber);
                   ref.child(database).child(uid+currentdate).child(userid).set(uid);
                   _progressDialog.dismissProgressDialog(context);
                    showAlertDialog2(context);

                    print('URL Is $url');

                  
                },
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

// secod alert box

showAlertDialog2(BuildContext context) {
  // Create AlertDialog
  AlertDialog alert2 = AlertDialog(
    title: Text('Thank You'),
    content: Text('Your Message Is Succesfullly Submited!!'),
    actions: <Widget>[
      new FlatButton(
        child: new Text('OK'),
        onPressed: () {
        Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) =>
                DashboardPage()),
            (Route<dynamic> route) =>
        false);
        },
      )
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert2;
    },
  );
}
