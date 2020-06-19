import 'package:duan_cntt2/src/UI/WareHouse/importproduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:duan_cntt2/src/constants/constants.dart';

class StateWareHouseNhapKho extends StatefulWidget {
  StateWareHouseNhapKho({Key key}) : super(key: key);

  @override
  _StateWareHouseNhapKho createState() => _StateWareHouseNhapKho();
}

class _StateWareHouseNhapKho extends State<StateWareHouseNhapKho> {
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
                                                  color: Colors.black
                                                      .withOpacity(0.15),
                                                  offset: Offset(0.8, 10.0),
                                                  blurRadius: 9.0,
                                                  spreadRadius: 2.0,
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Text(
                                            "Thoát",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w300),
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
                                                  color: Colors.black
                                                      .withOpacity(0.15),
                                                  offset: Offset(0.8, 10.0),
                                                  blurRadius: 9.0,
                                                  spreadRadius: 2.0,
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Text(
                                            "Đồng Ý",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w300),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        "Nhập Kho",
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
                    "13:13",
                    style: TextStyle(fontSize: 9),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 2),
                  child: Text(
                    "06/06/2020",
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

class AddProductHadX extends StatefulWidget {
  const AddProductHadX({
    Key key,
  }) : super(key: key);

  @override
  _AddProductHadX createState() => _AddProductHadX();
}

class _AddProductHadX extends State<AddProductHadX> {
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.text = "0"; // Setting the initial value for the field.
  }

  Widget build(BuildContext context) {
    return new Container(
        height: 150,
        alignment: Alignment.center,
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
        ),
        child: OutlineButton(
          onPressed: () {},
          child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Container(
              height: 100,
              child: new Image.network(
                "https://product.hstatic.net/1000088324/product/2__2__128daeaf24aa421ab7f3868a1acbae6f_master.png",
                width: 80,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    "Áo TeenWorld",
                    style: TextStyle(fontSize: 16),
                  ),
                  new Container(
                    padding: EdgeInsets.only(bottom: 8),
                  ),
                  new Text("Mã Sản Phẩm : 0124"),
                  new Container(
                    padding: EdgeInsets.only(bottom: 8),
                  ),
                  new Text("Giá Thành: 60.000đ"),
                ],
              ),
            ),
            new Expanded(child: Container()),
          ]),
        ));
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
            Navigator.pushNamed(context, Constants.paymentwarehouse);
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
                'Thanh Toán',
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

class TableRow4 extends StatelessWidget {
  const TableRow4({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom:20),
            child: Column(
              children: <Widget>[
                Text("Tổng tiền",
                    style:
                        TextStyle(fontSize: 23, fontWeight: FontWeight.w300)),
                Text("22.500.000 đ",
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.amber,
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade700),
              ),
            ),
          )
        ],
      ),
      onTap: () {
        print('Work1');
      },
    );
  }
}
