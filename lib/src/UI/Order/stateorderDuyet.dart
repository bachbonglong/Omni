import 'package:duan_cntt2/src/UI/Order/statusorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:duan_cntt2/src/constants/constants.dart';

class StateOrderDuyet extends StatefulWidget {
  StateOrderDuyet({Key key}) : super(key: key);

  @override
  _StateOrderDuyet createState() => _StateOrderDuyet();
}

class _StateOrderDuyet extends State<StateOrderDuyet> {
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
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            "SON00003",
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 15),
              child: IconButton(
                icon: Icon(Icons.delete_forever, color: Colors.black),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0))),
                          contentPadding: EdgeInsets.only(top: 10.0),
                          content: Container(
                            width: 500.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text("Huỷ Tạo Đơn Hàng",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Divider(
                                  color: Colors.grey,
                                  height: 4.0,
                                ),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  height: 100,
                                  child: Text(
                                    "Bạn vẫn chưa hoàn thành xong đơn hàng bạn có muốn huỷ đơn hàng",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey,
                                  height: 4.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width /
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
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.15),
                                                  offset: Offset(0.8, 10.0),
                                                  blurRadius: 9.0,
                                                  spreadRadius: 2.0,
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Text(
                                            "Thoát",
                                            style:
                                                TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    new Expanded(child: Container()),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      padding: EdgeInsets.all(15),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, Constants.order);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                            top: 20.0,
                                            bottom: 20.0,
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black.withOpacity(0.15),
                                                    offset: Offset(0.8, 10.0),
                                                    blurRadius: 9.0,
                                                    spreadRadius: 2.0,
                                                  ),
                                                ],
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Text(
                                            "Đồng Ý",
                                            style:
                                                TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
                                            textAlign: TextAlign.center,
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
              ),
            ),
          ],
        ),
        body: Container(
            height: 1000,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/src/res/img/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        new Container(padding: EdgeInsets.only(top: 20)),
                        StateOrder(),
                        new Container(padding: EdgeInsets.only(top: 20)),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Text("Tạo bởi HienisHien"),
                              Text("Chi nhánh mặc định"),
                            ],
                          ),
                        ),
                        new Container(padding: EdgeInsets.only(top: 10)),
                        AddProductHadX(),
                        new Container(padding: EdgeInsets.only(top: 40)),
                        TableRow1(),
                        new Container(padding: EdgeInsets.only(top: 20)),
                        TableRow2(),
                        new Container(padding: EdgeInsets.only(top: 20)),
                        TableRow3(),
                        new Container(padding: EdgeInsets.only(top: 20)),
                        TableRow4(),
                        new Container(padding: EdgeInsets.only(top: 40)),
                        AddNote(),
                        new Container(padding: EdgeInsets.only(top: 20)),
                      ],
                    ),
                  ),
                  new Container(padding: EdgeInsets.only(top: 10)),
                  ButtonSubmit1(),
                  new Container(padding: EdgeInsets.only(top: 20)),
                ],
              ),
            )));
  }
}

class StateOrder extends StatelessWidget {
  const StateOrder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.2)),
      child: Row(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Đặt Hàng",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 30),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.check,
                  ),
                  height: 25,
                  width: MediaQuery.of(context).size.width / 17,
                  decoration: BoxDecoration(
                    color: Colors.redAccent.shade100,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(width: 0.3),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 3),
                  child: Text(
                    "11:11",
                    style: TextStyle(fontSize: 9),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 2),
                  child: Text(
                    "05/05/2020",
                    style: TextStyle(fontSize: 9),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Duyệt",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 30),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.check,
                  ),
                  height: 25,
                  width: MediaQuery.of(context).size.width / 17,
                  decoration: BoxDecoration(
                    color: Colors.redAccent.shade100,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(width: 0.3),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 3),
                  child: Text(
                    "12:11",
                    style: TextStyle(fontSize: 9),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 2),
                  child: Text(
                    "05/05/2020",
                    style: TextStyle(fontSize: 9),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Đóng Gói",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 30),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 25,
                  width: MediaQuery.of(context).size.width / 17,
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 0.3)),
                ),
                Container(
                  padding: EdgeInsets.only(top: 3),
                  child: Text(
                    "",
                    style: TextStyle(fontSize: 9),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 2),
                  child: Text(
                    "",
                    style: TextStyle(fontSize: 9),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Xuất Kho",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 30),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 25,
                  width: MediaQuery.of(context).size.width / 17,
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 0.3)),
                ),
                Container(
                  padding: EdgeInsets.only(top: 3),
                  child: Text(
                    "",
                    style: TextStyle(fontSize: 9),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 2),
                  child: Text(
                    "",
                    style: TextStyle(fontSize: 9),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Hoàn Thành",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 30),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 25,
                  width: MediaQuery.of(context).size.width / 17,
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 0.3)),
                ),
                Container(
                  padding: EdgeInsets.only(top: 3),
                  child: Text(
                    "",
                    style: TextStyle(fontSize: 9),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 2),
                  child: Text(
                    "",
                    style: TextStyle(fontSize: 9),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonSubmit1 extends StatelessWidget {
  const ButtonSubmit1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Container(
        width: MediaQuery.of(context).size.width / 2.5,
        height: 50.0,
        child: GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    contentPadding: EdgeInsets.only(top: 10.0),
                    content: Container(
                      width: MediaQuery.of(context).size.width / 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Chọn phương thức giao hàng",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 4.0,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Constants.delivery);
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    height: 50,
                                    child: Text(
                                      "Đẩy đơn qua hãng vận chuyển",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Container(
            width: (136),
            height: (50),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.7, 0.2),
                end: Alignment(0.2, 2),
                colors: [const Color(0xffff9a9e), const Color(0xfffad0c4)],
              ),
              borderRadius: BorderRadius.circular((24)),
            ),
            child: Center(
              child: Text(
                'Xuất Kho',
                style: TextStyle(
                  fontFamily: 'Jura',
                  fontSize: (18),
                  color: const Color(0xfffbfcf6),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
