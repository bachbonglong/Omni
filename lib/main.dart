import 'package:duan_cntt2/src/UI/Page/adPage.dart';
import 'package:duan_cntt2/src/UI/Page/guestPage.dart';

import 'package:duan_cntt2/src/UI/login/setup/login.dart';
import 'package:duan_cntt2/src/UI/splashPage.dart';
import 'package:flutter/material.dart';
import 'package:duan_cntt2/src/constants/constants.dart';

void main() => runApp(MaterialApp(
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

    case Constants.adminPage:
      return new MaterialPageRoute(
        builder: (context) {
          return AdminPage();
        },
      );
      break;
    case Constants.guestPage:
      return new MaterialPageRoute(
        builder: (context) {
          return GuestPage();
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

      // case Constants.test:
      // return new MaterialPageRoute(
      //   builder: (context) {
      //     return Test();
      //   },
      // );
      // break;




    default:
      return null;
  }
}
