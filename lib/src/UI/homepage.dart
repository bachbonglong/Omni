import 'package:duan_cntt2/src/constants/constants.dart';
import 'package:flutter/material.dart'; 

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, Constants.homeLogin);
          },
        ),
    );
  }
}