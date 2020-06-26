import 'package:duan_cntt2/src/utils/widget/Chart.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatefulWidget {

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> with SingleTickerProviderStateMixin {
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
          title: Container(
            child: Text(
              'Trang Chủ ',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 27,
                color: (const Color(0xff413b3b)),
              ),
            ),
          )),
      body: Container(
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'Báo cáo',
                    style: TextStyle(
                      fontSize: 27,
                      color: (const Color(0xff413b3b)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: BartChart(),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  alignment: Alignment.center,
                  decoration: new BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400, width: 0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'Đơn hàng',
                            style: TextStyle(
                              fontFamily: 'Jura',
                              fontSize: (22),
                              color: const Color(0xff413b3b),
                            ),
                          )),
                      new Container(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      TableRow1(),
                      new Container(padding: EdgeInsets.only(top: 20)),
                      TableRow2(),
                      new Container(padding: EdgeInsets.only(top: 20)),
                      TableRow3(),
                      new Container(padding: EdgeInsets.only(top: 20)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
                Text("Chờ duyệt"),
                Row(
                  children: <Widget>[Text("0"), Icon(Icons.arrow_forward_ios)],
                ),
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.amber,
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade400),
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
                Text("Chờ Thanh Toán"),
                Row(
                  children: <Widget>[Text("0"), Icon(Icons.arrow_forward_ios)],
                ),
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.amber,
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade400),
              ),
            ),
          )
        ],
      ),
      onTap: () {
        print('Work2');
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
                Text("Chờ Xuất Kho"),
                Row(
                  children: <Widget>[Text("0"), Icon(Icons.arrow_forward_ios)],
                ),
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.amber,
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade400),
              ),
            ),
          )
        ],
      ),
      onTap: () {
        print('Work3');
      },
    );
  }
}
