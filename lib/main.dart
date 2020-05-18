import 'package:flutter/material.dart';
import 'package:phoneflutter/screens/dashboard.dart';
import 'package:phoneflutter/screens/hellologin.dart';
import 'package:phoneflutter/screens/landingpage.dart';
import 'package:phoneflutter/screens/loginpage.dart';
import 'package:phoneflutter/screens/signuppage.dart';
// import 'package:phoneflutter/screens/usernamepassword.dart';
import 'package:phoneflutter/services/authservice.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home:AuthService().handleAuth(),
     
      routes: {
    
    // '/signup': (context)=>AuthService().handleAuth(),
    '/login':(context)=> LoginPage(),
    '/dash':(context)=> DashboardPage(),
  },
    
    );
  }
}
  