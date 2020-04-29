import 'package:duan_cntt2/src/UI/Home/Assignment.dart';
import 'package:duan_cntt2/src/UI/Home/More.dart';
import 'package:duan_cntt2/src/UI/Home/Product.dart';
import 'package:duan_cntt2/src/UI/Home/Home.dart';
import 'package:duan_cntt2/src/UI/Home/Report.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          Assignment(),
          Report(),
          More(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: TabBar(
          labelColor: const Color(0xFF3baee7),
          indicatorWeight: 2,
          indicatorColor: Colors.blue[100],
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
                  Text("Báo Cáo")
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
