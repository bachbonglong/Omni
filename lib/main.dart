import 'package:duan_cntt2/src/UI/Home/Home.dart';
import 'package:duan_cntt2/src/UI/Home/HomePage.dart';
import 'package:duan_cntt2/src/UI/login/login.dart';
import 'package:duan_cntt2/src/UI/slpashPage.dart/splashPage.dart';
import 'package:flutter/material.dart';
import 'package:duan_cntt2/src/constants/constants.dart';

void main() => runApp(MaterialApp(
      // home: SplashPage(),
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routes,
    ));

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case Constants.splashScreen:
      return new MaterialPageRoute(
        builder: (context) {
          return SplashPage();
        },
      );
      break;
    case Constants.login:
      return new MaterialPageRoute(
        builder: (context) {
          return Login();
        },
      );
      break;
    case Constants.homepage:
      return new MaterialPageRoute(
        builder: (context) {
          return HomePage();
        },
      );
      break;
    case Constants.home:
      return new MaterialPageRoute(
        builder: (context) {
          return Home();
        },
      );
      break;
    default:
      return null;
  }
}
