// import 'package:duan_cntt2/src/constants/constants.dart';
import 'package:duan_cntt2/src/UI/homePage/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _validate = false;
  String _email, _password;
  bool _obscureText = true;
  bool _buttonChange = true;
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  /* void hide-show Passowrd */
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _buttonLog() {
    setState(() {
      _buttonChange = !_buttonChange;
      _formKey.currentState.reset();
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: _buttonChange ? Text("Đăng kí") : Text("Đăng Nhập"),
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
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: _toggle,
                  )),
              obscureText: _obscureText,
              keyboardType: TextInputType.emailAddress,
              validator: validatePassword,
              autofocus: false,
              onSaved: (String val) {
                _password = val;
              }),
        ),
        new SizedBox(height: 15.0),
        _buttonChange
            ? new RaisedButton(
                onPressed: signUp,
                child: new Text('Đăng Kí'),
              )
            : new RaisedButton(
                onPressed: signIn,
                child: new Text('Đăng Nhập'),
              ),
        _buttonChange
            ? Container(
                padding: EdgeInsets.only(top: 10),
                child: new InkWell(
                  child: Text("Bạn đã có tài khoản rồi , đăng nhập ngay !!"),
                  onTap: _buttonLog,
                ),
              )
            : Container(
                padding: EdgeInsets.only(top: 10),
                child: new InkWell(
                    child: Text("Bạn chưa có tài khoản , đăng kí ngay !!"),
                    onTap: _buttonLog),
              )
      ],
    );
  }

/* Sign In and ShowAler */
  void signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        AuthResult result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        FirebaseUser user = result.user;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home(user: user)));
      } catch (e) {
        print(e.message);
        showAlertDialogSignIn(context, e.message);
      }
    }
  }

  void signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        showAlertDialogSignUp(context, 'e.mesage');
      } catch (e) {
        print(e.message);
      }
    }
  }

  showAlertDialogSignUp(BuildContext context, String e) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget signin = FlatButton(
      child: Text("Đăng Nhập"),
      onPressed: _buttonLog
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Thông Báo !"),
      content: Text("Bạn đã đăng kí thành công"),
      actions: [
        okButton,
        signin,
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

  showAlertDialogSignIn(BuildContext context, String e) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Thông Báo !"),
      content: Text("Kiểm tra lại tài khoản hoặc mật khẩu"),
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

/* Sign Up and ShowAler */

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
