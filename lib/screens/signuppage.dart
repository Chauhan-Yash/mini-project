// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:phoneflutter/services/authservice.dart';

// class Signupage extends StatefulWidget {
//   @override
//   _SignupPageState createState() => _SignupPageState ();
// }

// class _SignupPageState  extends State<Signupage > {
//   final formKey = new GlobalKey<FormState>();

//   String phoneNo, verificationId, smsCode,uname;

//   bool codeSent = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               child: Stack(
//                 children: <Widget>[
//                   Container(
//                     padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
//                     child: Text('Hello',
//                         style: TextStyle(
//                             fontSize: 80.0, fontWeight: FontWeight.bold)),
//                   ),
//                   Container(
//                     padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
//                     child: Text('There',
//                         style: TextStyle(
//                             fontSize: 80.0, fontWeight: FontWeight.bold)),
//                   ),
//                   Container(
//                     padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
//                     child: Text('.',
//                         style: TextStyle(
//                             fontSize: 80.0,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.green)),
//                   )
//                 ],
//               ),
//             ),
//             Container(
//           child: Form(
//           key: formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(height: 120.0),
//               Padding( 
//                   padding: EdgeInsets.only(left: 25.0, right: 25.0),
//                   child: TextFormField(
//                     keyboardType: TextInputType.text,
//                     decoration: InputDecoration(
//                           labelText: 'USERNAME',
//                           labelStyle: TextStyle(
//                               fontFamily: 'Montserrat',
//                               fontWeight: FontWeight.bold,
//                               color: Colors.grey),
//                           focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.green))),
//                       // obscureText: true,
//                     onChanged: (val) {
//                       setState(() {
//                         this.uname = val;
//                       });
//                     },
//                   )),
//               SizedBox(height: 20.0),
//               Padding( 
//                   padding: EdgeInsets.only(left: 25.0, right: 25.0),
//                   child: TextFormField(
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(
//                           labelText: 'Enter phone no',
//                           labelStyle: TextStyle(
//                               fontFamily: 'Montserrat',
//                               fontWeight: FontWeight.bold,
//                               color: Colors.grey),
//                           focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.green))),
//                       // obscureText: true,
//                     onChanged: (val) {
//                       setState(() {
//                         this.phoneNo = "+91"+val;
//                       });
//                     },
//                   )),
//                   SizedBox(height: 20.0),
//                   codeSent ? Padding(
//                   padding: EdgeInsets.only(left: 25.0, right: 25.0),
//                   child: TextFormField(
//                     keyboardType: TextInputType.phone,
//                      decoration: InputDecoration(
//                           labelText: 'Enter OTP',
//                           labelStyle: TextStyle(
//                               fontFamily: 'Montserrat',
//                               fontWeight: FontWeight.bold,
//                               color: Colors.grey),
//                           focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.green))),
//                       obscureText: true,
//                     onChanged: (val) {
//                       setState(() {
//                         this.smsCode = val;
//                       });
//                     },
//                   )) : Container(),
//                  const SizedBox(height: 10),
//               Padding(
//                   padding: EdgeInsets.only(left: 25.0, right: 25.0),
//                   child:Container(
//                   height:53.0,
//                   child: RaisedButton(
                   
//                     shape: RoundedRectangleBorder(
//                     borderRadius: new BorderRadius.circular(23.0),
//                     ),
//                       color: Colors.green,
//                       child: Center(child: codeSent ? Text('Signup',style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16.0,
//                                   fontFamily: 'Montserrat'),):Text('Verify',style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16.0,
//                                   fontFamily: 'Montserrat'),)),
//                       onPressed: () {
//                         codeSent ? AuthService().signInWithOTP(smsCode, verificationId):verfyPhone(phoneNo);
//                       })
//               ))
//             ],
//           )
//           ),
//     ),
//           ]
//       )
//     );

//   }

//   Future<void> verfyPhone(phoneNo ) async {
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

//     var verifyPhoneNumber = FirebaseAuth.instance.verifyPhoneNumber(
//         // username:uname,
//         phoneNumber: phoneNo,
//         timeout: const Duration(seconds: 5),
//         verificationCompleted: verified,
//         verificationFailed: verificationfailed,
//         codeSent: smsSent,
//         codeAutoRetrievalTimeout: autoTimeout);
//     await verifyPhoneNumber;
//   }
// }
