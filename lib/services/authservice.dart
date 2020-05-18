import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phoneflutter/screens/landingpage.dart';

import 'package:phoneflutter/screens/signuppage.dart';
import 'package:phoneflutter/screens/loginpage.dart';
import 'package:phoneflutter/screens/dashboard.dart';
// import 'package:phoneflutter/screens/usernamepassword.dart';

class AuthService {
  //Handles Auth
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
     builder: (BuildContext context, snapshot) {
     if (snapshot.connectionState == ConnectionState.active) {
          FirebaseUser user = snapshot.data;
     if (user == null) {
            return LoginPage();
          } else {
            return DashboardPage();
          }
        }
     });
  }

  //Sign out
   signOut() {
    FirebaseAuth.instance.signOut();
  }

  //SignIn
  signIn(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);
  }

  signInWithOTP(smsCode, verId) {
    AuthCredential authCreds = PhoneAuthProvider.getCredential(
        verificationId: verId, smsCode: smsCode);
    signIn(authCreds);
  }
}
