
import 'package:duan_cntt2/src/UI/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:hexcolor/hexcolor.dart';
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: new AfterSplash(),
        image: new Image.asset(
            'lib/src/img/banner.png',
            ),
        backgroundColor: Hexcolor("#FBFCF6"),
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 150.0,
        onClick: () {},
        loaderColor: Colors.red);
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Login();
  }
}
