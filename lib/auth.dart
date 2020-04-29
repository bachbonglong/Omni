// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:duan_cntt2/src/UI/Home/HomePage.dart';
// import 'package:duan_cntt2/src/UI/Login/login.dart';
// import 'dart:convert' show json, base64, ascii;



// class Auth extends StatelessWidget {
//   final storage = new FlutterSecureStorage();
//   Future<String> get jwtOrEmpty async {
//     var jwt = await storage.read(key: "jwt");
//     if(jwt == null) return "";
//     return jwt;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Authentication Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: FutureBuilder(
//         future: jwtOrEmpty,            
//         builder: (context, snapshot) {
//           if(!snapshot.hasData) return CircularProgressIndicator();
//           if(snapshot.data != "") {
//             var str = snapshot.data;
//             var jwt = str.split(".");
//             if(jwt.length !=3) {
//               return Login();
//             } else {
//               var payload = json.decode(ascii.decode(base64.decode(base64.normalize(jwt[1]))));
//               if(DateTime.fromMillisecondsSinceEpoch(payload["exp"]*1000).isAfter(DateTime.now())) {
//                 return HomePage(str, payload);
//               } else {
//                 return Login();
//               }
//             }
//           } else {
//             return Login();
//           }
//         }
//       ),
//     );
//   }
// }

