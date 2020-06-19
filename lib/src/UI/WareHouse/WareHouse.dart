import 'package:duan_cntt2/src/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';


class WareHouse extends StatefulWidget {
  WareHouse({Key key}) : super(key: key);

  @override
  _WareHouse createState() => _WareHouse();
}

class _WareHouse extends State<WareHouse> with SingleTickerProviderStateMixin {
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
              'Kho Hàng',
              style: TextStyle(
                fontFamily: ('Jura'),
                fontSize: 27,
                color: (const Color(0xff413b3b)),
                fontWeight: FontWeight.w300
                
              ),
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
                  Navigator.pushNamed(context, Constants.sponsor);
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
      onPressed: (){
       Navigator.pushNamed(context,Constants.qrcamera);
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
            hintText: "Bạn Muốn Tìm Mã Đơn hàng ?",
            labelText: 'Nhập Để Tìm Kiếm Mã Đơn Hàng',
          ),
        ),
      ),
    );
  }
}

class ListOrder extends StatelessWidget {
  const ListOrder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 120,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    'PON00001',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Jura',
                      fontWeight: FontWeight.w400,
                      fontSize: (18),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                ),
                Container(
                  child: Text(
                    'Đã hoàn thành',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Jura',
                      fontSize: (14),
                      color: const Color(0xff3b82b6),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Tổng tiền :120.000đ",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                  ),
                  Container(
                    child: Text(
                      "Nhà cung cấp: Teenworld",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                  ),
                  Container(
                    child: Text(
                      "Ngày Thành Lập Đơn : 01/06/2020",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListOrder2 extends StatelessWidget {
  const ListOrder2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 120,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    'PON00002',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Jura',
                      fontWeight: FontWeight.w400,
                      fontSize: (18),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                ),
                Container(
                  child: Text(
                    'Chưa Nhập Kho',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Jura',
                      fontSize: (14),
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Tổng tiền :12000.000đ",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                  ),
                  Container(
                    child: Text(
                      "Nhà Cung Cấp : CIEL",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                  ),
                  Container(
                    child: Text(
                      "Ngày Thành Lập Đơn : 01/06/2020",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
