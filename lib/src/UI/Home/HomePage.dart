import 'package:duan_cntt2/src/UI/Home/Home.dart';
import 'package:duan_cntt2/src/UI/More/More.dart';
import 'package:duan_cntt2/src/UI/Order/Order.dart';
import 'package:duan_cntt2/src/UI/Product/Product.dart';
import 'package:duan_cntt2/src/UI/WareHouse/WareHouse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
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
      // appBar: PreferredSize(
      //   preferredSize: Size(double.infinity, 40),
      //   child: AppBar(
      //     titleSpacing: 0.0,
      //     leading: IconButton(
      //       icon: Icon(
      //         Icons.arrow_back,
      //         // color: AppTheme.of(context).appColor.iconBg,
      //       ),
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //     ),
      //     // flexibleSpace: Container(
      //     //   decoration: BoxDecoration(
      //     //     gradient: new LinearGradient(
      //     //       colors: [
      //     //         AppTheme.of(context).appColor.primaryDark.withOpacity(0.8),
      //     //         AppTheme.of(context).appColor.primaryBg,
      //     //       ],
      //     //       begin: const FractionalOffset(0.0, 0.0),
      //     //       end: const FractionalOffset(1.0, 0.0),
      //     //       stops: [0.0, 1.0],
      //     //       tileMode: TileMode.clamp
      //     //     )
      //     //   ),
      //     // ),
      //     backgroundColor: Colors.black,
      //     title: Container(
      //         child: Row(
      //       children: <Widget>[
      //         Expanded(
      //           child: Text(
      //             "Báo Cáo",
      //             style: TextStyle(
      //               color: Hexcolor("#FBFCF6"),
      //             ),
      //           ),
      //         ),
      //         IconButton(
      //           icon: Icon(
      //             Icons.share,
      //             color: Hexcolor("#FBFCF6"),
      //           ),
      //           onPressed: () {},
      //         ),
      //         IconButton(
      //           icon: Icon(
      //             Icons.shopping_cart,
      //             color: Hexcolor("#FBFCF6"),
      //           ),
      //           onPressed: () {
      //             Navigator.pushNamed(context, Constants.homepage);
      //           },
      //         ),
      //       ],
      //     )),
      //   ),
      // ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Home(),
          Product(),
          Order(),
          WareHouse(),
          More(),
        ],
      ),
      bottomNavigationBar: Container(
        // decoration: BoxDecoration(
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.15),   // Bóng !!
        //     offset: Offset(0.8, 10.0),
        //     blurRadius: 9.0,
        //     spreadRadius: 2.0,
        //   ),
        // ],
        // ),
        padding: EdgeInsets.only(top:5),
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
                children: <Widget>[
                  Icon(Icons.home),
                  Text("Trang Chủ")
                ],
              ),
            ),
            Tab(
              icon: Column(
                children: <Widget>[
                  Icon(Icons.store),
                  Text("Sản Phẩm")
                ],
              ),
            ),
            Tab(
              icon: Column(
                children: <Widget>[
                  Icon(Icons.assignment),
                  Text("Đơn Hàng")
                ],
              ),
            ),
            Tab(
              icon: Column(
                children: <Widget>[
                  Icon(Icons.assessment),
                  Text("Kho Hàng")
                ],
              ),
            ),
            Tab(
              icon: Column(
                children: <Widget>[
                  Icon(Icons.menu),
                  Text("Thêm")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
