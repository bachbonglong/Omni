import 'package:duan_cntt2/src/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:duan_cntt2/src/API/query.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Order extends StatefulWidget {
  Order({@required this.client});

  final GraphQLClient client;

  @override
  _Assignment createState() => _Assignment();
}

class _Assignment extends State<Order> with SingleTickerProviderStateMixin {
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
              'Đơn Hàng',
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
                  Navigator.pushNamed(context, Constants.addorder);
                },
              ),
            )
          ],
        ),
        body: Query(
            options: QueryOptions(
              documentNode: gql(order),
              variables: {},
            ),
            builder: (QueryResult result,
                {VoidCallback refetch, FetchMore fetchMore}) {
              if (result.loading) {
                return Center(child: CircularProgressIndicator());
              }
              if (result.data == null) {
                print(result.data);

                return Center(
                  child: Column(
                    children: <Widget>[
                      Text("Không có Data"),
                    ],
                  ),
                );
              }
              return Container(
                  height: double.infinity,
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
                            Container(
                                child: KeyboardDismisser(
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
                                        Navigator.pushNamed(
                                            context, Constants.qrcamera);
                                      },
                                      icon: Icon(Icons.fullscreen),
                                    ),
                                    border: OutlineInputBorder(),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        left: 15,
                                        bottom: 11,
                                        top: 11,
                                        right: 15),
                                    hintText: "Bạn Muốn Tìm Mã Đơn hàng ?",
                                    labelText: 'Nhập Để Tìm Kiếm Mã Đơn Hàng',
                                  ),
                                ),
                              ),
                            )),
                            new Container(padding: EdgeInsets.all(10)),
                            Container(
                              height: MediaQuery.of(context).size.width * 1.5,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      result.data['order']['orders'].length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return new Container(
                                      margin:
                                          EdgeInsets.only(bottom: 10, top: 10),
                                      height: 120,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.15),
                                            offset: Offset(0.8, 10.0),
                                            blurRadius: 9.0,
                                            spreadRadius: 2.0,
                                          ),
                                        ],
                                      ),
                                      child: OutlineButton(
                                        onPressed: () {
                                          print(result.data["order"]['orders']
                                              [index]['customer_name']);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  child: Text(
                                                    result.data['order']
                                                            ['orders'][index]
                                                            ['id']
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily: 'Jura',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: (18),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(5),
                                                ),
                                                if (result.data['order']
                                                            ['orders'][index]
                                                        ['status'] ==
                                                    1)
                                                  Container(
                                                    child: Text(
                                                      'Đang tạo mới',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontFamily: 'Jura',
                                                          fontSize: (14),
                                                          color: Colors
                                                              .blueAccent),
                                                    ),
                                                  ),
                                                if (result.data['order']
                                                            ['orders'][index]
                                                        ['status'] ==
                                                    4)
                                                  Container(
                                                    child: Text(
                                                      'Đã nhận được',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontFamily: 'Jura',
                                                          fontSize: (14),
                                                          color:
                                                              Colors.redAccent),
                                                    ),
                                                  ),
                                                if (result.data['order']
                                                            ['orders'][index]
                                                        ['status'] ==
                                                    2)
                                                  Container(
                                                    child: Text(
                                                      'Đã Xác Nhận',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontFamily: 'Jura',
                                                          fontSize: (14),
                                                          color: Colors.orange),
                                                    ),
                                                  ),
                                                if (result.data['order']
                                                            ['orders'][index]
                                                        ['status'] ==
                                                    7)
                                                  Container(
                                                    child: Text(
                                                      'Đã Huỷ',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontFamily: 'Jura',
                                                          fontSize: (14),
                                                          color: Colors
                                                              .greenAccent),
                                                    ),
                                                  ),
                                                if (result.data['order']
                                                            ['orders'][index]
                                                        ['status'] ==
                                                    5)
                                                  Container(
                                                    child: Text(
                                                      'Đang Trả Hàng Về',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontFamily: 'Jura',
                                                          fontSize: (14),
                                                          color:
                                                              Colors.blueGrey),
                                                    ),
                                                  ),
                                                if (result.data['order']
                                                            ['orders'][index]
                                                        ['status'] ==
                                                    6)
                                                  Container(
                                                    child: Text(
                                                      'Đã Trả Hàng Về',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontFamily: 'Jura',
                                                          fontSize: (14),
                                                          color: Colors.purple),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 5),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: <Widget>[
                                                  Container(
                                                    child: Text(
                                                      "Tổng tiền :" +
                                                          result.data['order']
                                                                  ['orders']
                                                                  [index]
                                                                  ['amount']
                                                              .toString() +
                                                          " đ",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(5),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      "Khách Hàng :" +
                                                          result.data["order"]
                                                                      ["orders"]
                                                                  [index]
                                                              ["customer_name"],
                                                      overflow:
                                                          TextOverflow.fade,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(5),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      "Ngày Thành Lập Đơn :" +
                                                          result.data["order"]
                                                                  ["orders"]
                                                                  [index][
                                                                  'date_created']
                                                              .toString(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      )));
            }));
  }
}
