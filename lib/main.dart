import 'package:duan_cntt2/src/UI/Page/adPage.dart';
import 'package:duan_cntt2/src/UI/Page/guestPage.dart';
import 'package:duan_cntt2/src/UI/homepage.dart';
import 'package:duan_cntt2/src/UI/login/setup/welcome.dart';
import 'package:flutter/material.dart';
import 'package:duan_cntt2/src/constants/constants.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routes,
    ));

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case Constants.homePage:
      return new MaterialPageRoute(
        builder: (context) {
          return HomePage();
        },
      );
      break;

    case Constants.homeLogin:
      return new MaterialPageRoute(
        builder: (context) {
          return WelcomePage();
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

    default:
      return null;
  }
}
