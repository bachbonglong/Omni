import 'package:firebase_auth/firebase_auth.dart';
import 'package:duan_cntt2/src/UI/login/setup/sign_in.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email ;
  String _password ;
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Form Validation'),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _formKey,
              autovalidate: _validate,
              child: formui(),
            ),
          ),
        ),
      ),
    );
  }
  Widget formui() {
    return new Column(
      children: <Widget>[
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Email '),
            keyboardType: TextInputType.emailAddress,
            validator: validateEmail,
            onSaved: (String val) {
              _email = val;
            }),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Password'),
            keyboardType: TextInputType.phone,
            validator: validatePassword,
            onSaved: (String val) {
              _password = val;
            }),
        new SizedBox(height: 15.0),
        new RaisedButton(
          onPressed: signUp,
          child: new Text('Đăng Kí'),
        )
      ],
    );
  }
  void signUp() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      }catch(e){
        print(e.message);
      }
    }
  }
    String validateEmail(String input) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(input))
      return 'Định dạng email chưa đúng !';
    else
      return null;
  }

    String validatePassword(String value) {
    String pattern = r'^(?=.*[A-Z])(?=.*[a-z])(?=.*?[0-9])' ;
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Password không được bỏ trống";
    } else if (!regExp.hasMatch(value)) {
      return "Password phải bắt đầu chữ in hoa , và phải có ít nhất 1 chữ số ";
    }
    return null;
  }
}
