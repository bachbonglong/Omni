import 'package:duan_cntt2/src/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Payment extends StatefulWidget {
  Payment({Key key}) : super(key: key);

  @override
  _Payment createState() => _Payment();
}

class _Payment extends State<Payment> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Hexcolor("#FBFCF6"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Phương Thức Thanh Toán',
            style: TextStyle(
              fontFamily: ('Jura'),
              fontSize: 23,
              color: (const Color(0xff413b3b)),
              fontWeight: FontWeight.w300
            ),
          )),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(90),

                      ),
                      new Container(padding: EdgeInsets.all(10)),
                      Text(
                        "Tổng Tiền Cần Thanh Toán  \n\n 100.000đ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30,fontWeight: FontWeight.w300),
                      ),
                      new Container(padding: EdgeInsets.all(10)),
                      new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          OutlineButton(
                            focusColor: Colors.red,
                            splashColor: Colors.yellowAccent.shade400,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20.0)),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(32.0))),
                                      contentPadding:
                                          EdgeInsets.only(top: 10.0),
                                      content: Container(
                                        width: 500.0,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Text(
                                                  "Xác Nhận Thông Tin",
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 1.0,
                                            ),
                                            Divider(
                                              color: Colors.grey,
                                              height: 4.0,
                                            ),
                                            Text(
                                              "Tổng Tiền \n\n 100.000đ \n\n Hình Thức  : Chuyển Khoản",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  padding: EdgeInsets.all(15),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                        top: 20.0,
                                                        bottom: 20.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Colors.white,
                                                              boxShadow: [
                                                                    BoxShadow(
                                                                      color: Colors.black.withOpacity(0.15),
                                                                      offset: Offset(0.8, 10.0),
                                                                      blurRadius: 9.0,
                                                                      spreadRadius: 2.0,
                                                                    ),
                                                                  ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50)),
                                                      child: Text(
                                                        "Huỷ",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                new Expanded(
                                                    child: Container()),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  padding: EdgeInsets.all(15),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.pushNamed(
                                                          context,
                                                          Constants.paymenthad);
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                        top: 20.0,
                                                        bottom: 20.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Colors.white,
                                                              boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors.black.withOpacity(0.15),
                                                                    offset: Offset(0.8, 10.0),
                                                                    blurRadius: 9.0,
                                                                    spreadRadius: 2.0,
                                                                  ),
                                                                ],                  
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50)),
                                                      child: Text(
                                                        "Xác Nhận ",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width/3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.ccVisa,
                                    size: 30,
                                  ),
                                  Text("\nChuyển Khoản")
                                ],
                              ),
                            ),
                          ),
                          OutlineButton(
                            splashColor: Colors.yellowAccent.shade400,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20.0)),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(32.0))),
                                      contentPadding:
                                          EdgeInsets.only(top: 10.0),
                                      content: Container(
                                        width: 500.0,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Text(
                                                  "Xác Nhận Thông Tin",
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Divider(
                                              color: Colors.grey,
                                              height: 4.0,
                                            ),
                                            Text(
                                              "Tổng Tiền \n\n 100.000đ \n\n Hình Thức : Tiền Mặt",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  padding: EdgeInsets.all(15),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                        top: 20.0,
                                                        bottom: 20.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Colors.white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors.black.withOpacity(0.15),
                                                                  offset: Offset(0.8, 10.0),
                                                                  blurRadius: 9.0,
                                                                  spreadRadius: 2.0,
                                                                ),
                                                              ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50)),
                                                      child: Text(
                                                        "Huỷ",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black,fontWeight: FontWeight.w300),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                new Expanded(
                                                    child: Container()),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  padding: EdgeInsets.all(15),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.pushNamed(
                                                          context,
                                                          Constants.paymenthad);
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                        top: 20.0,
                                                        bottom: 20.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Colors.white,
                                                              boxShadow: [
                                                              BoxShadow(
                                                                color: Colors.black.withOpacity(0.15),
                                                                offset: Offset(0.8, 10.0),
                                                                blurRadius: 9.0,
                                                                spreadRadius: 2.0,
                                                              ),
                                                            ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50)),
                                                      child: Text(
                                                        "Xác Nhận ",
                                                        style: TextStyle(
                                                            color:
                                                                 Colors.black,fontWeight: FontWeight.w300),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width/3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.moneyBillWave,
                                    size: 30,
                                  ),
                                  Text("\nTiền Mặt")
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      new Container(padding: EdgeInsets.all(10)),
                    ],
                  ),
                ))));
  }
}
