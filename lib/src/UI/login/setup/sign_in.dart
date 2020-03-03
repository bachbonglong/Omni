import 'package:firebase_auth/firebase_auth.dart';
import 'package:duan_cntt2/src/UI/login/home.dart';
import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _validate = false;
  String _email, _password;
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

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
        new Hero(
          tag: 'hero',
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 48.0,
              child: Image.asset('lib/src/img/login_logo.png'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
          child: new TextFormField(
              maxLines: 1,
              decoration: new InputDecoration(
                  hintText: 'Email',
                  icon: new Icon(
                    Icons.mail,
                    color: Colors.grey,
                  )),
              keyboardType: TextInputType.emailAddress,
              validator: validateEmail,
              onSaved: (String val) {
                _email = val;
              }),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
          child: new TextFormField(
              maxLines: 1,
              decoration: new InputDecoration(
                  hintText: 'Password',
                  icon: new Icon(
                    Icons.lock,
                    color: Colors.grey,
                  )),
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              validator: validatePassword,
              autofocus: false,
              onSaved: (String val) {
                _password = val;
              }),
        ),
        new SizedBox(height: 15.0),
        new RaisedButton(
          onPressed: signIn,
          child: new Text('Đăng Nhập'),
        ),
      ],
    );
  }

  void signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        AuthResult result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        FirebaseUser user = result.user;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home(user: user)));
      } 
      catch (e) {
        print(e.message);
        _formKey.currentState.reset();
        showAlertDialog(context, e.message);
      }

    }
  }
  

  showAlertDialog(BuildContext context,String e) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () { },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(e),
    content: Text("This is my message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
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
    String pattern = r'^(?=.*[A-Z])(?=.*[a-z])(?=.*?[0-9])';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Password không được bỏ trống";
    } else if (!regExp.hasMatch(value)) {
      return "Password phải bắt đầu chữ in hoa , và phải có ít nhất 1 chữ số ";
    }
    return null;
  }
}
