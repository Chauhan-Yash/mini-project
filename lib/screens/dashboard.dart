import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phoneflutter/screens/helplineno.dart';
import 'package:phoneflutter/screens/landingpage.dart';
import 'package:phoneflutter/screens/sendlocation.dart';
import 'package:phoneflutter/services/authservice.dart';

import 'camera.dart';

class DashboardPage extends StatefulWidget {


  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Police App',
      theme: new ThemeData(
        primaryColor: Colors.green
      ),
      home: new SideDrawer(),		
    );
  }	
}
class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
 
  int _selectedTabIndex = 0; 

  List _pages = [
    Mappage(),
     Sendlocation(), 
    Helplineno(),
    Sendvideo(), 
  ]; 

  _changeIndex(int index) {
    setState(() {
      _selectedTabIndex = index; 
    }); 
  } 

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
    return new Scaffold(
      drawer: new Drawer(
        child: new ListView(
          padding: const EdgeInsets.only(top: 0.0),
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName:  Text('${phoneNumber}'),
             
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text("AB")
              ),
        
            ),
           
            new ListTile(
              leading: new Icon(Icons.lock_outline),
              title: new Text('signout'),
              onTap: () =>AuthService().signOut(),
            ),
            new ListTile(
              leading: new Icon(Icons.person),
              title: new Text('profile'),
              onTap: () => AuthService().signOut(),
            ),
            new ListTile(
              leading: new Icon(Icons.phone),
              title: new Text('help line no'),
              onTap: () =>Helplineno(),
            ),
          ]
        )
      ),
      
     
      
      appBar: new AppBar(
        title: new Text('Home'),
      ),
      body: Center(child: _pages[_selectedTabIndex]), 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex, 
        onTap: _changeIndex, 
        type: BottomNavigationBarType.fixed, 
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")), 
          BottomNavigationBarItem(
              icon: Icon(Icons.add_location), title: Text("Send")), 
          BottomNavigationBarItem(
              icon: Icon(Icons.phone), title: Text("Helpline")), 
          BottomNavigationBarItem(
              icon: Icon(Icons.videocam), title: Text("Video")), 
        ], 
      ), 
    ); 
  }
}