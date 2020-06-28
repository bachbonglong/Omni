import 'package:duan_cntt2/src/UI/Home/Home.dart';
import 'package:duan_cntt2/src/UI/More/More.dart';
import 'package:duan_cntt2/src/UI/Order/Order.dart';
import 'package:duan_cntt2/src/UI/Product/Product.dart';
import 'package:duan_cntt2/src/UI/WareHouse/WareHouse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.client}) : super(key: key);
  final GraphQLClient client;

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 5, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Home(),
          Product(
            client: widget.client,
          ),
          Order(
            client: widget.client,
          ),
          WareHouse(),
          More(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 5),
        color: Hexcolor("#DCD9CD").withOpacity(0.05), //màu nền tab bar !!
        child: TabBar(
          labelColor: Colors.black,
          indicatorWeight: 1,
          indicatorColor: Colors.white,
          controller: _tabController,
          labelPadding: EdgeInsets.all(0.0),
          tabs: <Widget>[
            Tab(
              icon: Column(
                children: <Widget>[Icon(Icons.home), Text("Trang Chủ")],
              ),
            ),
            Tab(
              icon: Column(
                children: <Widget>[Icon(Icons.store), Text("Sản Phẩm")],
              ),
            ),
            Tab(
              icon: Column(
                children: <Widget>[Icon(Icons.assignment), Text("Đơn Hàng")],
              ),
            ),
            Tab(
              icon: Column(
                children: <Widget>[Icon(Icons.assessment), Text("Kho Hàng")],
              ),
            ),
            Tab(
              icon: Column(
                children: <Widget>[Icon(Icons.menu), Text("Thêm")],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
