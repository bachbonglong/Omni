import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminPage extends StatefulWidget {
  @override
  const AdminPage({ Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Mobile Registration App"),
        backgroundColor: Colors.teal,
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}