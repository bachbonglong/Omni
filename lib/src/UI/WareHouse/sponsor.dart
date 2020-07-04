import 'package:duan_cntt2/src/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class Sponsor extends StatefulWidget {
  Sponsor({Key key}) : super(key: key);

  @override
  _Sponsor createState() => _Sponsor();
}

class _Sponsor extends State<Sponsor> {
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
              'Nhà Cung Cấp',
              style: TextStyle(
                  fontFamily: ('Jura'),
                  fontSize: 27,
                  color: (const Color(0xff413b3b)),
                  fontWeight: FontWeight.w300),
            ),
          ),
          actions: <Widget>[
            Container(
              child: FloatingActionButton(
                mini: true,
                focusColor: Colors.black,
                backgroundColor: Colors.white,
                hoverColor: Colors.black,
                foregroundColor: Colors.black,
                splashColor: Colors.grey,
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, Constants.addsponsor);
                },
              ),
            )
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
            child: RefreshIndicator(
                onRefresh: () async {
                  await new Future.delayed(const Duration(seconds: 2));
                },
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Container(padding: EdgeInsets.all(10)),
                      Container(child: Search()),
                      new Container(padding: EdgeInsets.all(10)),
                      Container(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 50, right: 50),
                        child: Text(
                          "Bạn cần chọn nhà cung cấp trước khi tạo đơn nhập",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      new Container(padding: EdgeInsets.all(10)),
                      ListOrder(),
                      new Container(padding: EdgeInsets.all(10)),
                      ListOrder2(),
                      new Container(padding: EdgeInsets.all(10)),
                    ],
                  ),
                ))));
  }
}

class Search extends StatelessWidget {
  const Search({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
        GestureType.onTapCancel,
      ],
      child: new Container(
        height: 80,
        width: MediaQuery.of(context).size.width / 1.3,
        margin: EdgeInsets.only(left: 10, right: 10),
        alignment: Alignment.center,
        decoration: new BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: Offset(0.8, 10.0),
              blurRadius: 9.0,
              spreadRadius: 2.0,
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          cursorColor: Colors.black,
          keyboardType: TextInputType.text,
          maxLines: 1,
          decoration: new InputDecoration(
            prefixIcon: Icon(Icons.zoom_in),
            suffixIcon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Constants.qrcamera);
              },
              icon: Icon(Icons.fullscreen),
            ),
            border: OutlineInputBorder(),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:
                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            hintText: "Bạn Muốn Tìm Mã Nhà Cung Cấp ?",
            labelText: 'Nhập Để Tìm Kiếm Nhà Cung Cấp',
          ),
        ),
      ),
    );
  }
}

class ListOrder extends StatefulWidget {
  const ListOrder({
    Key key,
  }) : super(key: key);

  @override
  _ListOrderState createState() => _ListOrderState();
}

class _ListOrderState extends State<ListOrder> {
  bool choose = true;
  tap() {
    setState(() {
      choose = !choose;
      Navigator.pushNamed(context, Constants.importproduct);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 100,
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
        textColor: choose ? Colors.black : Colors.blue,
        onPressed: tap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    "Tên Nhà Cung Cấp : Teenworld",
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Jura',
                      fontWeight: FontWeight.w400,
                      fontSize: (18),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Số điện thoại : 0976853035',
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Jura',
                      fontSize: (14),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Địa Chỉ : Mai Chí Thọ, Quận 7, TP.Hồ Chí Minh',
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Jura',
                      fontSize: (14),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ListOrder2 extends StatefulWidget {
  const ListOrder2({
    Key key,
  }) : super(key: key);

  @override
  _ListOrder2State createState() => _ListOrder2State();
}

class _ListOrder2State extends State<ListOrder2> {
  bool choose = true;
  tap() {
    setState(() {
      choose = !choose;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 100,
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
        textColor: choose ? Colors.black : Colors.blue,
        onPressed: tap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    "Tên Nhà Cung Cấp : CIEL",
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Jura',
                      fontWeight: FontWeight.w400,
                      fontSize: (18),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Số điện thoại : 0914180198',
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Jura',
                      fontSize: (14),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Địa Chỉ : Thủ Đức',
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Jura',
                      fontSize: (14),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
