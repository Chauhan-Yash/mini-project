

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:phoneflutter/services/authservice.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final formKey = new GlobalKey<FormState>();

//   String phoneNo, verificationId, smsCode;

//   bool codeSent = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//           key: formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Padding(
//                   padding: EdgeInsets.only(left: 25.0, right: 25.0),
//                   child: TextFormField(
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(hintText: 'Enter phone number'),
//                     onChanged: (val) {
//                       setState(() {
//                         this.phoneNo = "+91"+val;
//                       });
//                     },
//                   )),
//                   codeSent ? Padding(
//                   padding: EdgeInsets.only(left: 25.0, right: 25.0),
//                   child: TextFormField(
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(hintText: 'Enter OTP'),
//                     onChanged: (val) {
//                       setState(() {
//                         this.smsCode = val;
//                       });
//                     },
//                   )) : Container(),
//               Padding(
//                   padding: EdgeInsets.only(left: 25.0, right: 25.0),
//                   child: RaisedButton(
//                       child: Center(child: codeSent ? Text('Login'):Text('Verify')),
//                       onPressed: () {
//                         codeSent ? AuthService().signInWithOTP(smsCode, verificationId):verifyPhone(phoneNo);
//                       }))
//             ],
//           )),
//     );
//   }

//   Future<void> verifyPhone(phoneNo) async {
//     final PhoneVerificationCompleted verified = (AuthCredential authResult) {
//       AuthService().signIn(authResult);
//     };

//     final PhoneVerificationFailed verificationfailed =
//         (AuthException authException) {
//       print('${authException.message}');
//     };

//     final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
//       this.verificationId = verId;
//       setState(() {
//         this.codeSent = true;
//       });
//     };

//     final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
//       this.verificationId = verId;
//     };

//     await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: phoneNo,
//         timeout: const Duration(seconds: 5),
//         verificationCompleted: verified,
//         verificationFailed: verificationfailed,
//         codeSent: smsSent,
//         codeAutoRetrievalTimeout: autoTimeout);
//   }
// }
///////////////////////////////////////////////////////////////////
// /loginpage/////////
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:phoneflutter/services/authservice.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final formKey = new GlobalKey<FormState>();

//   String phoneNo, verificationId, smsCode,uname,pwd;

//   bool codeSent = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//           key: formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//                 // Padding(
//                 //   padding: EdgeInsets.only(left: 25.0, right: 25.0,top:12.0),
//                 //   child: TextFormField(
//                 //     keyboardType: TextInputType.text,
//                 //     decoration: InputDecoration(hintText: 'Enter username '),
//                 //     onChanged: (name) {
//                 //       setState(() {
//                 //         this.uname = name;
//                 //       });
//                 //     },
//                 //   )),
//                 //    Padding(
//                 //   padding: EdgeInsets.only(left: 25.0, right: 25.0,top:12.0),
//                 //   child: TextFormField(
//                 //     keyboardType: TextInputType.text,
//                 //     decoration: InputDecoration(hintText: 'Enter password '),
//                 //     onChanged: (pssw) {
//                 //       setState(() {
//                 //         this.pwd = pssw;
//                 //       });
//                 //     },
//                 //   )),
//               Padding(
//                   padding: EdgeInsets.only(left: 25.0, right: 25.0,top:12.0),
//                   child: TextFormField(
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(hintText: 'Enter phone number'),
//                     onChanged: (val) {
//                       setState(() {
//                         this.phoneNo = "+91"+val;
//                       });
//                     },
//                   )),
//                   codeSent ? Padding(
//                   padding: EdgeInsets.only(left: 25.0, right: 25.0,top:12.0),
//                   child: TextFormField(
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(hintText: 'Enter OTP'),
//                     onChanged: (val) {
//                       setState(() {
//                         this.smsCode = val;
//                       });
//                     },
//                   )) : Container(),
//               Padding(
//                   padding: EdgeInsets.only(left: 25.0, right: 25.0),
//                   child: RaisedButton(
//                      color: Colors.lightGreen,
//                       child: Center(child: codeSent ? Text('Login'):Text('Verify')),
//                        shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(16.0))),
//                       onPressed: () {
//                         codeSent ? AuthService().signInWithOTP(smsCode, verificationId):verifyPhone(phoneNo);
//                       }))
//             ],
//           )),
//     );
//   }

//   Future<void> verifyPhone(phoneNo) async {
//     final PhoneVerificationCompleted verified = (AuthCredential authResult) {
//       AuthService().signIn(authResult);
//     };

//     final PhoneVerificationFailed verificationfailed =
//         (AuthException authException) {
//       print('${authException.message}');
//     };

//     final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
//       this.verificationId = verId;
//       setState(() {
//         this.codeSent = true;
//       });
//     };

//     final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
//       this.verificationId = verId;
//     };

//     await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: phoneNo,
//         timeout: const Duration(seconds: 5),
//         verificationCompleted: verified,
//         verificationFailed: verificationfailed,
//         codeSent: smsSent,
//         codeAutoRetrievalTimeout: autoTimeout);
//   }
// }
////////////////////////////////////////////////////////////////////
// /login page/'/'
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:phoneflutter/services/authservice.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final formKey = new GlobalKey<FormState>();

//   String phoneNo, verificationId, smsCode;

//   bool codeSent = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//           key: formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Padding(
//                   padding: EdgeInsets.only(left: 25.0, right: 25.0),
//                   child: TextFormField(
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(hintText: 'Enter phone number'),
//                     onChanged: (val) {
//                       setState(() {
//                         this.phoneNo = "+91"+val;
//                       });
//                     },
//                   )),
//                   codeSent ? Padding(
//                   padding: EdgeInsets.only(left: 25.0, right: 25.0),
//                   child: TextFormField(
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(hintText: 'Enter OTP'),
//                     onChanged: (val) {
//                       setState(() {
//                         this.smsCode = val;
//                       });
//                     },
//                   )) : Container(),
//               Padding(
//                   padding: EdgeInsets.only(left: 25.0, right: 25.0),
//                   child: RaisedButton(
//                       child: Center(child: codeSent ? Text('Signup'):Text('Verify')),
//                       onPressed: () {
//                         codeSent ? AuthService().signInWithOTP(smsCode, verificationId):verifyPhone(phoneNo);
//                       }))
//             ],
//           )),
//     );
//   }

//   Future<void> verifyPhone(phoneNo) async {
//     final PhoneVerificationCompleted verified = (AuthCredential authResult) {
//       AuthService().signIn(authResult);
//     };

//     final PhoneVerificationFailed verificationfailed =
//         (AuthException authException) {
//       print('${authException.message}');
//     };

//     final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
//       this.verificationId = verId;
//       setState(() {
//         this.codeSent = true;
//       });
//     };

//     final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
//       this.verificationId = verId;
//     };

//     await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: phoneNo,
//         timeout: const Duration(seconds: 5),
//         verificationCompleted: verified,
//         verificationFailed: verificationfailed,
//         codeSent: smsSent,
//         codeAutoRetrievalTimeout: autoTimeout);
//   }
// }
