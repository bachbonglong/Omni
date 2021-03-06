import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:duan_cntt2/src/constants/constants.dart';

class AddOrder extends StatefulWidget {
  AddOrder({Key key}) : super(key: key);

  @override
  _AddOrder createState() => _AddOrder();
}

class _AddOrder extends State<AddOrder> {
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
              Navigator.pushNamed(context, Constants.homepage);
            },
          ),
        title: Container(
          child: Text(
            'Tạo Đơn Hàng',
            style: TextStyle(
              fontFamily: ('Jura'),
              fontSize: 27,
              color: (const Color(0xff413b3b)),
              fontWeight: FontWeight.w300
              
            ),
          ),
        ),),
        body: Container(
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
                    padding: EdgeInsets.only(top: 10 ,),
                    
                    child: FlatButton(
                      onPressed: () {                        Navigator.pushNamed(context, Constants.qrcamera);
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
                          Text("Quét Sản Phẩm Bằng QR CODE", style: TextStyle(fontWeight: FontWeight.w300),)
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
                        TableRow4(),
                        new Container(padding: EdgeInsets.only(top: 40)),
                        AddNote(),
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
                Text("Tổng số lượng", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
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
                Text("Tổng tiền hàng", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
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
                Text("Khách Hàng", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    )
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
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Phương Thức Thanh Toán", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    )
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

class TableRow5 extends StatelessWidget {
  const TableRow5({
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
                Text("Phương Thức Thanh Toán", style: TextStyle(fontSize: 20)),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    )
                  ],
                ),
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.only(left: 10, right: 10),
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
        Navigator.pushNamed(context, Constants.addproductorder);
      },
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(15.0)),////////////////////////////////////////////////đây
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

class AddNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0))),
                contentPadding: EdgeInsets.only(top: 10.0),
                content: Container(
                  width: 500.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Thêm Ghi Chú",
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300),
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
                      Padding(
                        padding:
                            EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Ghi thêm ghi chú cho người giao hàng ",
                            border: InputBorder.none,
                          ),
                          maxLines: 8,
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 4.0,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
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
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "Huỷ",
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          new Expanded(child: Container()),
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
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
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "Thêm",
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
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
      child: new Container(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Thêm Ghi Chú",
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
