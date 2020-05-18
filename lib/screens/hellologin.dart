// import 'package:flutter/material.dart';
// // import 'package:phoneflutter/screens/loginpage.dart';
// // import 'package:phoneflutter/screens/dashboard.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:phoneflutter/services/authservice.dart';



// class SignupPage extends StatefulWidget {
//   @override
//  _SignupPageState createState() => new _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//    final formKey = new GlobalKey<FormState>();
//    String phoneNo, verificationId, smsCode,uname;

//   bool codeSent = false;
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         resizeToAvoidBottomPadding: false,
//         body: Column(
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
//                 padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
//                 child: Form(
//                 key: formKey,
//                   child:Column(
//                   children: <Widget>[
//                     TextField(
//                       decoration: InputDecoration(
//                           labelText: 'USERNAMEs',
//                           labelStyle: TextStyle(
//                               fontFamily: 'Montserrat',
//                               fontWeight: FontWeight.bold,
//                               color: Colors.grey),
//                           focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.green))),
//                     onChanged: (val) {
//                       setState(() {
//                         this.uname = val;
//                       });
//                     },
//                     ),
//                     SizedBox(height: 20.0),
//                     TextField(
//                       decoration: InputDecoration(
//                           labelText: 'Enter the no',
//                           labelStyle: TextStyle(
//                               fontFamily: 'Montserrat',
//                               fontWeight: FontWeight.bold,
//                               color: Colors.grey),
//                           focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.green))),
//                       // obscureText: true,
//                        onChanged: (val) {
//                       setState(() {
//                         this.phoneNo = "+91"+val;
//                       });
//                     },
//                     ),
//                     SizedBox(height: 5.0),
//                     Container(
//                       alignment: Alignment(1.0, 0.0),
//                       padding: EdgeInsets.only(top: 15.0, left: 20.0),
//                       child: InkWell(
//                         child: Text(
//                           'Forgot Password',
//                           style: TextStyle(
//                               color: Colors.green,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Montserrat',
//                               decoration: TextDecoration.underline),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 40.0),
//                     Container(
//                       height: 40.0,
//                       child: Material(
//                         borderRadius: BorderRadius.circular(20.0),
//                         shadowColor: Colors.greenAccent,
//                         color: Colors.green,
//                         elevation: 7.0,
//                         child: GestureDetector(
//                           onTap: () {},
//                           child: Center(
//                             // Navigator.pushNamed(context, '/dash'),
//                             child: Text(
//                               'LOGIN',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: 'Montserrat'),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
                    
                    
//                   ],
//                 )
//             )),
//             SizedBox(height: 15.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   'New to Spotify ?',
//                   style: TextStyle(fontFamily: 'Montserrat'),
//                 ),
//                 SizedBox(width: 5.0),
//                 InkWell(
//                   onTap: () {
//                     Navigator.of(context).pushNamed('/signup');
//                   },
//                   child: Text(
//                     'Register',
//                     style: TextStyle(
//                         color: Colors.green,
//                         fontFamily: 'Montserrat',
//                         fontWeight: FontWeight.bold,
//                         decoration: TextDecoration.underline),
//                   ),
//                 )
//               ],
//             )
//           ],
//         )
//         );
    
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

