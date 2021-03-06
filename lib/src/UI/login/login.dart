import 'package:duan_cntt2/main.dart';
import 'package:duan_cntt2/src/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:duan_cntt2/src/API/token.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'CustomIcons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../API/query.dart';
import 'package:commons/commons.dart';

class Login extends StatefulWidget {
  Login({@required this.client});

  final ValueNotifier<GraphQLClient> client;

  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String username;
  String password;
  final storage = new FlutterSecureStorage();

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool _validate = false;

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              )
            : Container(),
      );

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(120),
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  @override
  Widget build(BuildContext context) {
    // final client = widget.client;
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
      backgroundColor: Hexcolor("#FBFCF6"),
      resizeToAvoidBottomPadding: true,
      body: Query(
        options: QueryOptions(
          documentNode: gql(getToken),
          variables: {
            "username": _usernameController.text,
            "password": _passwordController.text,
          },
        ),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (result.data == null) {
            return Center(
              child: Text("Không có Data"),
            );
          }
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: Container(),
                  ),
                  Image.asset("lib/src/res/img/image_02.png"),
                ],
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Image.asset(
                          "lib/src/res/img/banner.png",
                        ),
                      ),
                      Form(
                          key: _formKey,
                          autovalidate: _validate,
                          child: (Container(
                            width: double.infinity,
                            height: ScreenUtil.getInstance().setHeight(500),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0.0, 15.0),
                                      blurRadius: 15.0),
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0.0, -10.0),
                                      blurRadius: 10.0),
                                ]),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 16.0, right: 16.0, top: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Đăng Nhập",
                                      style: TextStyle(
                                          fontSize: ScreenUtil.getInstance()
                                              .setSp(45),
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .6)),
                                  SizedBox(
                                    height:
                                        ScreenUtil.getInstance().setHeight(30),
                                  ),
                                  Text("Tài Khoản",
                                      style: TextStyle(
                                          fontFamily: "Poppins-Medium",
                                          fontSize: ScreenUtil.getInstance()
                                              .setSp(26))),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: "username",
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 12.0),
                                    ),
                                    keyboardType: TextInputType.text,
                                    controller: _usernameController,
                                  ),
                                  SizedBox(
                                    height:
                                        ScreenUtil.getInstance().setHeight(30),
                                  ),
                                  Text("Mật Khẩu",
                                      style: TextStyle(
                                          fontFamily: "Poppins-Medium",
                                          fontSize: ScreenUtil.getInstance()
                                              .setSp(26))),
                                  TextFormField(
                                    obscureText: _obscureText,
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 12.0),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscureText
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                        ),
                                        onPressed: _toggle,
                                      ),
                                    ),
                                    keyboardType: TextInputType.text,
                                    controller: _passwordController,
                                  ),
                                  SizedBox(
                                    height:
                                        ScreenUtil.getInstance().setHeight(35),
                                  ),
                                ],
                              ),
                            ),
                          ))),
                      SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            child: Container(
                              width: ScreenUtil.getInstance().setWidth(330),
                              height: ScreenUtil.getInstance().setHeight(100),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Color(0xFF17ead9),
                                    Color(0xFF6078ea)
                                  ]),
                                  borderRadius: BorderRadius.circular(6.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color(0xFF6078ea).withOpacity(.3),
                                        offset: Offset(0.0, 8.0),
                                        blurRadius: 8.0)
                                  ]),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () async {
                                    if (result.data['auth']['login']
                                            ['accessToken'] ==
                                        null) {
                                      var jwt = result.data['auth']['login']
                                          ['accessToken'];
                                      print(jwt);
                                      return _showDialog();
                                    } else {
                                      var jwt = result.data['auth']['login']
                                          ['accessToken'];
                                      storage.write(key: "jwt", value: jwt);
                                      final client = await authClient();
                                      widget.client.value = client;
                                      print(jwt);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetTokenHeader(jwt)));
                                    }
                                  },
                                  child: Center(
                                    child: Text("Đăng Nhập",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: ('Jura'),
                                            fontSize: 23,
                                            letterSpacing: 1.0)),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(40),
                      ),
                      Container(
                        child: FlatButton(
                            onPressed: () => {
                                  Navigator.pushNamed(context, Constants.signup)
                                },
                            child: Text(
                              "Bạn chưa có tài khoản ? Đăng kí nhanh!",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                                color: Colors.blueAccent,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(30),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    warningDialog(context, "Bạn đã đăng nhập sai tài khoản \nhoặc  mật khẩu",
        positiveAction: () {});
  }
}
