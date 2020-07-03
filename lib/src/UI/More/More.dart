import 'package:duan_cntt2/src/API/query.dart';
import 'package:duan_cntt2/src/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class More extends StatefulWidget {
  More({Key key, this.client}) : super(key: key);

  final GraphQLClient client;
  @override
  _More createState() => _More();
}

class _More extends State<More> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  final storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Hexcolor("#FBFCF6"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, Constants.homepage);
            },
          ),
          title: Row(
            children: <Widget>[
              Text('Easy to Control',
                  style: TextStyle(
                    fontFamily: ('SimSun-ExtB'),
                    fontSize: 13,
                    color: (const Color(0xff344755)),
                    shadows: [
                      Shadow(
                        color: const Color(0xff000000).withOpacity(0.16),
                        offset: Offset(0, 3),
                        blurRadius: 0.0,
                      ),
                    ],
                  )),
              Text(' Omni ',
                  style: TextStyle(
                    fontFamily: ('VNI-Briquet'),
                    fontSize: ((27)),
                    color: (const Color(0xff344755)),
                    shadows: [
                      Shadow(
                        color: const Color(0xff000000).withOpacity(0.16),
                        offset: Offset(0, 3),
                        blurRadius: 0.0,
                      ),
                    ],
                  )),
              Text(
                ' Easy to Succeed',
                style: TextStyle(
                  fontFamily: ('SimSun-ExtB'),
                  fontSize: (13),
                  color: (const Color(0xff344755)),
                  shadows: [
                    Shadow(
                      color: const Color(0xff000000).withOpacity(0.16),
                      offset: Offset(0, 3),
                      blurRadius: 0.0,
                    ),
                  ],
                ),
              ),
              new Expanded(child: Container()),
            ],
          ),
        ),
        body: Container(
            height: 1000,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/src/res/img/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: RefreshIndicator(
                onRefresh: () async {
                  await new Future.delayed(const Duration(seconds: 2));
                },
                child: SingleChildScrollView(
                  child: Query(
                      options: QueryOptions(
                        documentNode: gql(user),
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
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              alignment: Alignment.center,
                              child: ClipOval(
                                child: Container(
                                  color: Colors.blueAccent.shade100,
                                  height: 80.0, // height of the button
                                  width: 80.0, // width of the button
                                  child: Center(
                                      child: Text(
                                    result.data['user']['users'][0]
                                            ['display_name']
                                        .toString()
                                        .substring(0, 1),
                                    style: TextStyle(
                                        fontSize: 50, color: Colors.white),
                                  )),
                                ),
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    result.data['user']['users'][0]
                                            ['display_name'] +
                                        "\n\n" +
                                        result.data['user']['users'][0]
                                            ['email'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            new Container(
                              margin:
                                  EdgeInsets.only(left: 30, right: 30, top: 10),
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade700),
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(left: 30, right: 30, top: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Bán Hàng Tại Chỗ",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                            ),
                            new Container(
                              margin:
                                  EdgeInsets.only(left: 30, right: 30, top: 10),
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade700),
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(left: 30, right: 30, top: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Vận Chuyển",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                            ),
                            new Container(
                              margin:
                                  EdgeInsets.only(left: 30, right: 30, top: 10),
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade700),
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(left: 30, right: 30, top: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Hỗ Trợ",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                            ),
                            new Container(
                              margin:
                                  EdgeInsets.only(left: 30, right: 30, top: 30),
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade700),
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(left: 30, right: 30, top: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Cài đặt hệ thống",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                            ),
                            new Container(
                              margin:
                                  EdgeInsets.only(left: 30, right: 30, top: 30),
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade700),
                                ),
                              ),
                            ),
                            FlatButton(
                              onPressed: () async {
                                storage.delete(key: "jwt");
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    Constants.login,
                                    (Route<dynamic> route) => false);
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      height: 50,
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0xFFF05A22),
                                          style: BorderStyle.solid,
                                          width: 1.0,
                                        ),
                                        gradient: LinearGradient(
                                            end: Alignment.topRight,
                                            begin: Alignment.bottomLeft,
                                            colors: [
                                              Colors.white,
                                              Colors.red[300]
                                            ]),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Center(
                                            child: Text(
                                              "Đăng Xuất",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Montserrat',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 1,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Easy to Control',
                                    style: TextStyle(
                                      fontFamily: ('SimSun-ExtB'),
                                      fontSize: 13,
                                      color: (const Color(0xff344755)),
                                      shadows: [
                                        Shadow(
                                          color: const Color(0xff000000)
                                              .withOpacity(0.16),
                                          offset: Offset(0, 3),
                                          blurRadius: 0.0,
                                        ),
                                      ],
                                    )),
                                Text(' Omni ',
                                    style: TextStyle(
                                      fontFamily: ('VNI-Briquet'),
                                      fontSize: ((27)),
                                      color: (const Color(0xff344755)),
                                      shadows: [
                                        Shadow(
                                          color: const Color(0xff000000)
                                              .withOpacity(0.16),
                                          offset: Offset(0, 3),
                                          blurRadius: 0.0,
                                        ),
                                      ],
                                    )),
                                Text(
                                  ' Easy to Succeed',
                                  style: TextStyle(
                                    fontFamily: ('SimSun-ExtB'),
                                    fontSize: (13),
                                    color: (const Color(0xff344755)),
                                    shadows: [
                                      Shadow(
                                        color: const Color(0xff000000)
                                            .withOpacity(0.16),
                                        offset: Offset(0, 3),
                                        blurRadius: 0.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                ))));
  }
}
