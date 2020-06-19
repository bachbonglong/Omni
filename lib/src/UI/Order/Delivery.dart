import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:hexcolor/hexcolor.dart';
import 'package:duan_cntt2/src/constants/constants.dart';

class Delivery extends StatefulWidget {
  Delivery({Key key}) : super(key: key);

  @override
  _Delivery createState() => _Delivery();
}

class _Delivery extends State<Delivery> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text("Giao Hàng", style: TextStyle(color: Colors.black))),
        body: Container(
            height: 1000,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/src/res/img/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Container(padding: EdgeInsets.only(top: 20)),
                    AddOrderBox(),
                    new Container(padding: EdgeInsets.only(top: 20)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text("Thông tin gói hàng",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    new Container(padding: EdgeInsets.only(top: 20)),
                    TableRow1(),
                    new Container(padding: EdgeInsets.only(top: 20)),
                    TableRow2(),
                    new Container(padding: EdgeInsets.only(top: 20)),
                    TableRow3(),
                    new Container(padding: EdgeInsets.only(top: 40)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text("Lựa chọn đơn vị vận chuyển",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    new Container(padding: EdgeInsets.only(top: 20)),
                    GiaoHang1(),
                    new Container(padding: EdgeInsets.only(top: 20)),
                    GiaoHang2(),
                    new Container(padding: EdgeInsets.only(top: 20)),
                    GiaoHang3(),
                    new Container(padding: EdgeInsets.only(top: 20)),
                  ],
                ),
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
                Text("Thu hộ COD", style: TextStyle(fontSize: 17)),
                Row(
                  children: <Widget>[
                    Text("0 đ", style: TextStyle(fontSize: 17)),
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
                Text("Khối Lượng", style: TextStyle(fontSize: 17)),
                Row(
                  children: <Widget>[
                    Text("0 kg", style: TextStyle(fontSize: 17)),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text("Ghi chú ", style: TextStyle(fontSize: 17)),
          ),
          new Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
            child: Text(
                "Hàng dễ vỡ chạy cẩn thận. Rơi vỡ là bên bộ phận giao hàng chịu trách nhiệm"),
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

class AddOrderBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Container(
        decoration:
            BoxDecoration(color: Colors.white, 
            boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: Offset(0.8, 10.0),
            blurRadius: 9.0,
            spreadRadius: 2.0,
          ),
        ],
            ),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 5),
              child: Text("Giao hàng đến", style: TextStyle(fontSize: 20),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 5),
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Text(
                    "Dương Hoàng Tuấn - 0947636842",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
            Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: Text(
                    "Địa chỉ : Chung cư Linh Đông đường Phạm Văn Đồng , Thủ Đức, Thành Phố Hồ Chí Minh", style: TextStyle(fontSize: 20))),
          ],
        ),
      ),
    );
  }
}

class GiaoHang1 extends StatefulWidget {
  @override
  _GiaoHang1State createState() => _GiaoHang1State();
}

class _GiaoHang1State extends State<GiaoHang1> {
  bool show = true;
  tap() {
    setState(() {
      show = !show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: tap,
      child: show
          ? new Container(
              width: MediaQuery.of(context).size.width / 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    child: Image.network(
                      "https://cdn.nhanh.vn/cdn/store/26/artCT/22280/dich_vu_van_chuyen_ghn_express_1.png",
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Giao Hàng Nhanh",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Giá Giao Hàng : 50.000đ",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            )
          : new Container(
              width: MediaQuery.of(context).size.width / 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 100,
                        child: Image.network(
                          "https://cdn.nhanh.vn/cdn/store/26/artCT/22280/dich_vu_van_chuyen_ghn_express_1.png",
                        ),
                      ),
                      Text(
                        "Giao Hàng Nhanh ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  new Container(
                    margin: EdgeInsets.only(left: 5, right: 5, bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Địa chỉ lấy hàng \n\nChi nhánh mặc định",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 20),
                      ),
                      Icon(Icons.arrow_right)
                    ],
                  ),
                  new Container(
                    margin:
                        EdgeInsets.only(left: 5, right: 5, bottom: 10, top: 10),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Gói dịch vụ \n\nGói chuẩn -GHN.01",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 20),
                      ),
                      Icon(Icons.arrow_right)
                    ],
                  ),
                  new Container(
                    margin:
                        EdgeInsets.only(left: 5, right: 5, bottom: 10, top: 10),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Thời gian giao hàng dự kiến\n\nNgày : 11/05/2020",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 20),
                      ),

                    ],
                  ),
                  new Container(
                    margin:
                        EdgeInsets.only(left: 5, right: 5, bottom: 10, top: 10),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Phí vận chuyển",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 20),
                      ),
                      Text(
                        "50.000 đ",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 20),
                      ),
                    ],
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, Constants.statusorderDonggoi);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0.7, 0.2),
                                end: Alignment(0.2, 2),
                                colors: [
                                  const Color(0xffff9a9e),
                                  const Color(0xfffad0c4)
                                ],
                              ),
                              borderRadius: BorderRadius.circular((24)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    "Xác nhận giao hàng",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class GiaoHang2 extends StatefulWidget {
  @override
  _GiaoHang2State createState() => _GiaoHang2State();
}

class _GiaoHang2State extends State<GiaoHang2> {
  bool show = true;
  tap() {
    setState(() {
      show = !show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: tap,
      child: show
          ? new Container(
              width: MediaQuery.of(context).size.width / 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    child: Image.network(
                      "https://kerryttc.com.vn/wp-content/uploads/2019/11/Giao-H%C3%A0ng-Ti%E1%BA%BFc-Ki%E1%BB%87m3.jpg",
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Giao Hàng Tiết Kiệm ",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Giá Giao Hàng : 30.000đ",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            )
          : new Container(
              width: MediaQuery.of(context).size.width / 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 100,
                        child: Image.network(
                          "https://kerryttc.com.vn/wp-content/uploads/2019/11/Giao-H%C3%A0ng-Ti%E1%BA%BFc-Ki%E1%BB%87m3.jpg",
                        ),
                      ),
                      Text(
                        "Giao Hàng Tiết Kiệm ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  new Container(
                    margin: EdgeInsets.only(left: 5, right: 5, bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Địa chỉ lấy hàng \n\nChi nhánh mặc định",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 20),
                      ),
                      Icon(Icons.arrow_right)
                    ],
                  ),
                  new Container(
                    margin:
                        EdgeInsets.only(left: 5, right: 5, bottom: 10, top: 10),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Gói dịch vụ \n\nGói chuẩn -GHN.01",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 20),
                      ),
                      Icon(Icons.arrow_right)
                    ],
                  ),
                  new Container(
                    margin:
                        EdgeInsets.only(left: 5, right: 5, bottom: 10, top: 10),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Thời gian giao hàng dự kiến\n\nNgày : 13/05/2020",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 20),
                      ),

                    ],
                  ),
                  new Container(
                    margin:
                        EdgeInsets.only(left: 5, right: 5, bottom: 10, top: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Phí vận chuyển",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 20),
                      ),
                      Text(
                        "30.000 đ",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 20),
                      ),
                    ],
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, Constants.statusorderDonggoi);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0.7, 0.2),
                                end: Alignment(0.2, 2),
                                colors: [
                                  const Color(0xffff9a9e),
                                  const Color(0xfffad0c4)
                                ],
                              ),
                              borderRadius: BorderRadius.circular((24)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    "Xác nhận giao hàng",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class GiaoHang3 extends StatefulWidget {
  @override
  _GiaoHang3State createState() => _GiaoHang3State();
}

class _GiaoHang3State extends State<GiaoHang3> {
  bool show = true;
  tap() {
    setState(() {
      show = !show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: tap,
      child: show
          ? new Container(
              width: MediaQuery.of(context).size.width / 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    child: Image.network(
                      "https://static.ybox.vn/2018/10/3/1540362072895-Ninja%20van.png",
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Ninja Van",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Giá Giao Hàng : 15.000 đ",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            )
          : new Container(
              width: MediaQuery.of(context).size.width / 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 100,
                        child: Image.network(
                          "https://static.ybox.vn/2018/10/3/1540362072895-Ninja%20van.png",
                        ),
                      ),
                      Text(
                        "Ninja Van",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  new Container(
                    margin: EdgeInsets.only(left: 5, right: 5, bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Địa chỉ lấy hàng \n\nChi nhánh mặc định",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 20),
                      ),
                      Icon(Icons.arrow_right)
                    ],
                  ),
                  new Container(
                    margin:
                        EdgeInsets.only(left: 5, right: 5, bottom: 10, top: 10),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Gói dịch vụ \n\nGói chuẩn -GHN.01",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 20),
                      ),
                      Icon(Icons.arrow_right)
                    ],
                  ),
                  new Container(
                    margin:
                        EdgeInsets.only(left: 5, right: 5, bottom: 10, top: 10),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Thời gian giao hàng dự kiến\n\nNgày : 11/05/2020",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 20),
                      ),

                    ],
                  ),
                  new Container(
                    margin:
                        EdgeInsets.only(left: 5, right: 5, bottom: 10, top: 10),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Phí vận chuyển",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 20),
                      ),
                      Text(
                        "15.000 đ",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 20
                            ),
                      ),
                    ],
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, Constants.statusorderDonggoi);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0.7, 0.2),
                                end: Alignment(0.2, 2),
                                colors: [
                                  const Color(0xffff9a9e),
                                  const Color(0xfffad0c4)
                                ],
                              ),
                              borderRadius: BorderRadius.circular((24)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    "Xác nhận giao hàng",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
