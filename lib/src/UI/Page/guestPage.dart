import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GuestPage extends StatefulWidget {
  @override
  const GuestPage({ Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  _GuestPageState createState() => _GuestPageState();
}

class _GuestPageState extends State<GuestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Mobile Registration Appaaaaaaaaaaaaaaaa"),
        backgroundColor: Colors.teal,
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}