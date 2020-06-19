import 'package:duan_cntt2/src/constants/constants.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'CustomIcons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final HttpLink httpLink = HttpLink(uri: 'https://api-dev.azsales.vn/graphql');
  final storage = FlutterSecureStorage();
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

  String auth = """""";
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

  // Future<String> attemptLogIn(String username, String password) async {
  //   var res =
  //       await http.post("", body: {"username": username, "password": password});
  //   if (res.statusCode == 200) return res.body;

  //   return null;
  // }

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
        backgroundColor: Hexcolor("#FBFCF6"),
        resizeToAvoidBottomPadding: true,
        body: Query(
            options: QueryOptions(
              documentNode: gql(auth),
            ),
            builder: (QueryResult result,
                {VoidCallback refetch, FetchMore fetchMore}) {
              if (result.loading) {
                return Center(child: CircularProgressIndicator());
              }
              // List auths =result.data['viewer']['repositories']['nodes'];

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
                      padding:
                          EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Login",
                                          style: TextStyle(
                                              fontSize: ScreenUtil.getInstance()
                                                  .setSp(45),
                                              fontFamily: "Poppins-Bold",
                                              letterSpacing: .6)),
                                      SizedBox(
                                        height: ScreenUtil.getInstance()
                                            .setHeight(30),
                                      ),
                                      Text("Username",
                                          style: TextStyle(
                                              fontFamily: "Poppins-Medium",
                                              fontSize: ScreenUtil.getInstance()
                                                  .setSp(26))),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText: "username",
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.0),
                                        ),
                                        keyboardType: TextInputType.text,
                                        controller: _usernameController,
                                      ),
                                      SizedBox(
                                        height: ScreenUtil.getInstance()
                                            .setHeight(30),
                                      ),
                                      Text("PassWord",
                                          style: TextStyle(
                                              fontFamily: "Poppins-Medium",
                                              fontSize: ScreenUtil.getInstance()
                                                  .setSp(26))),
                                      TextFormField(
                                        obscureText: _obscureText,
                                        decoration: InputDecoration(
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.0),
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
                                        height: ScreenUtil.getInstance()
                                            .setHeight(35),
                                      ),
                                    ],
                                  ),
                                ),
                              ))),
                          SizedBox(
                              height: ScreenUtil.getInstance().setHeight(40)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                child: Container(
                                  width: ScreenUtil.getInstance().setWidth(330),
                                  height:
                                      ScreenUtil.getInstance().setHeight(100),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Color(0xFF17ead9),
                                        Color(0xFF6078ea)
                                      ]),
                                      borderRadius: BorderRadius.circular(6.0),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xFF6078ea)
                                                .withOpacity(.3),
                                            offset: Offset(0.0, 8.0),
                                            blurRadius: 8.0)
                                      ]),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        {
                                          Navigator.pushNamed(
                                              context, Constants.homepage);
                                        }
                                      }
                                      // async {
                                      //   var username = _usernameController.text;
                                      //   var password = _passwordController.text;
                                      //   var jwt = await attemptLogIn(username, password);
                                      //   if (jwt != '{"error":{"message":"login fail"}}') {
                                      //     storage.write(key: "jwt", value: jwt);
                                      //     Navigator.push(
                                      //         context,
                                      //         MaterialPageRoute(
                                      //             builder: (context) =>
                                      //                 HomePage.fromBase64(jwt)));
                                      //   }
                                      //     else {
                                      //     displayDialog(context, "An Error Occurred",
                                      //         "No account was found matching that username and password");
                                      //   }
                                      // },
                                      ,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              horizontalLine(),
                              Text("Social Login",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: "Poppins-Medium")),
                              horizontalLine()
                            ],
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(40),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SocialIcon(
                                colors: [
                                  Color(0xFF102397),
                                  Color(0xFF187adf),
                                  Color(0xFF00eaf8),
                                ],
                                iconData: CustomIcons.facebook,
                                onPressed: () {},
                              ),
                              SocialIcon(
                                colors: [
                                  Color(0xFFff4f38),
                                  Color(0xFFff355d),
                                ],
                                iconData: CustomIcons.googlePlus,
                                onPressed: () {},
                              ),
                              SocialIcon(
                                colors: [
                                  Color(0xFF17ead9),
                                  Color(0xFF6078ea),
                                ],
                                iconData: CustomIcons.twitter,
                                onPressed: () {},
                              ),
                              SocialIcon(
                                colors: [
                                  Color(0xFF00c6fb),
                                  Color(0xFF005bea),
                                ],
                                iconData: CustomIcons.linkedin,
                                onPressed: () {},
                              )
                            ],
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
            }));
  }
}

class SocialIcon extends StatelessWidget {
  final List<Color> colors;
  final IconData iconData;
  final Function onPressed;
  SocialIcon({this.colors, this.iconData, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.only(left: 14.0),
      child: Container(
        width: 45.0,
        height: 45.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: colors, tileMode: TileMode.clamp)),
        child: RawMaterialButton(
          shape: CircleBorder(),
          onPressed: onPressed,
          child: Icon(iconData, color: Colors.white),
        ),
      ),
    );
  }
}
