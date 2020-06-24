
// import 'package:duan_cntt2/src/UI/Hien_Widget/demo.dart';
import 'package:duan_cntt2/src/UI/login/login.dart';
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
            'lib/src/res/img/banner.png',
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
    // return Demo();  // Nếu muốn tự viết ra Demo thì xài cái này
    return Login(); // Nếu muốn sửa lại file thì xài cái này

    // Ctrl + /
  }
}
