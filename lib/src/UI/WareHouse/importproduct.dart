import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:duan_cntt2/src/constants/constants.dart';

class ImportProduct extends StatefulWidget {
  ImportProduct({Key key}) : super(key: key);

  @override
  _ImportProduct createState() => _ImportProduct();
}

class _ImportProduct extends State<ImportProduct> {
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
          title: Container(
            child: Text(
              'Tạo Đơn Hàng',
              style: TextStyle(
                  fontFamily: ('Jura'),
                  fontSize: 27,
                  color: (const Color(0xff413b3b)),
                  fontWeight: FontWeight.w300),
            ),
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 120,
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Constants.qrcamera);
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Icon(
                              FontAwesomeIcons.qrcode,
                              size: 80,
                            ),
                          ),
                          Text(
                            "Quét Sản Phẩm Bằng QR CODE",
                            style: TextStyle(fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        AddOrderBox(),
                        new Container(padding: EdgeInsets.only(top: 50)),
                        TableRow1(),
                        new Container(padding: EdgeInsets.only(top: 20)),
                        TableRow2(),
                        new Container(padding: EdgeInsets.only(top: 20)),
                        TableRow3(),
                        new Container(padding: EdgeInsets.only(top: 20)),
                      ],
                    ),
                  ),
                  new Container(padding: EdgeInsets.only(top: 20)),
                  ButtonSubmit()
                ],
              ),
            )));
  }
}

class TableRow1 extends StatelessWidget {
  const TableRow1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Tổng số lượng",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
                Row(
                  children: <Widget>[
                    Text("0", style: TextStyle(fontSize: 20)),
                  ],
                ),
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

class TableRow2 extends StatelessWidget {
  const TableRow2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Tổng tiền hàng",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
                Row(
                  children: <Widget>[
                    Text("0", style: TextStyle(fontSize: 20)),
                  ],
                ),
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

class TableRow3 extends StatelessWidget {
  const TableRow3({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Nhà cung cấp",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Teenworld",
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          fontSize: 19, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "0976853035",
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          fontSize: 19, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
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

class ButtonSubmit extends StatelessWidget {
  const ButtonSubmit({
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
            // Navigator.pushNamed(context, Constants.product);
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
                'Tạo Đơn Hàng',
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

class AddOrderBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {
        Navigator.pushNamed(context, Constants.addproductwarehouse);
      },
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(
              15.0)), ////////////////////////////////////////////////đây
      child: new Container(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Thêm Sản Phẩm",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
}
