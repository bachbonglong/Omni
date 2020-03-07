import 'package:duan_cntt2/src/UI/homePage/home.dart';
import 'package:duan_cntt2/src/UI/login/login.dart';
import 'package:flutter/material.dart'; 
import 'package:splashscreen/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';


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
      title: new Text('Chào mừng đến với Onmi',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),),
      image: new Image.network('https://cdn.playbackonline.ca/wp/wp-content/uploads/2011/02/OMNI-TV.jpg'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: (){},
      loaderColor: Colors.red
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context){
        return FutureBuilder<FirebaseUser>(
            future: FirebaseAuth.instance.currentUser(),
            builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot){
                       if (snapshot.hasData){
                           FirebaseUser user = snapshot.data; // this is your user instance
                           /// is because there is user already logged
                           return Home();
                        }
                         /// other way there is no user logged.
                         return Login();
             }
          );
    }
}
 