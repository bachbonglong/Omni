import 'package:duan_cntt2/src/UI/Product/UpdateProduct.dart';
import 'package:duan_cntt2/src/constants/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:duan_cntt2/src/API/query.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Product extends StatefulWidget {
  Product({@required this.client});

  final GraphQLClient client;

  @override
  _Product createState() => _Product();
}

class _Product extends State<Product> with SingleTickerProviderStateMixin {
  final storage = new FlutterSecureStorage();
  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    super.initState();
  }

  List<String> _phanloai = [
    'Tất Cả Sản Phẩm'
        'Áo Nam',
    'Dép Nữ',
    'Quần Nam',
    'Quần Nữ'
  ];
  String _selectPhanloai;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Hexcolor("#FFFFFF"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushNamed(context, Constants.homepage);
          },
        ),
        title: Container(
          child: Text(
            'Sản Phẩm',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 27,
              color: (const Color(0xff413b3b)),
            ),
          ),
        ),
        actions: <Widget>[
          Container(
            child: FloatingActionButton(
              heroTag: null,
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
                Navigator.pushNamed(context, Constants.addproduct);
              },
            ),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => super.widget));
          await Future.value({});
        },
        child: Query(
            options: QueryOptions(
              documentNode: gql(products),
              variables: {},
            ),
            builder: (QueryResult result,
                {VoidCallback refetch, FetchMore fetchMore}) {
              if (result.loading) {
                return Center(child: CircularProgressIndicator());
              }
              if (result.data == null) {
                print(result.exception);
                return Center(
                  child: SingleChildScrollView(
                    child: RefreshIndicator(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Data load có vấn đề",
                              style: TextStyle(fontSize: 30),
                            ),
                            Image.asset("lib/src/res/img/conbug.png"),
                            Text(
                              "Hãy Load Lại Trang",
                              style: TextStyle(fontSize: 30),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: FloatingActionButton(
                                  hoverColor: Colors.red,
                                  child: Icon(Icons.data_usage),
                                  onPressed: () async {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                super.widget));
                                    await Future.value({});
                                  }),
                            )
                          ],
                        ),
                      ),
                      onRefresh: () async {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    super.widget));
                        await Future.value({});
                      },
                    ),
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
                child: SingleChildScrollView(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => super.widget));
                      await Future.value({});
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Container(padding: EdgeInsets.all(10)),
                        Container(child: Search()),
                        new Container(padding: EdgeInsets.all(10)),
                        PhanLoai(
                            selectPhanloai: _selectPhanloai,
                            phanloai: _phanloai),
                        new Container(padding: EdgeInsets.all(10)),
                        listViewProduct(context, result),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Container listViewProduct(BuildContext context, QueryResult result) {
    return Container(
      child: new ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        shrinkWrap: true,
        itemCount: result.data['product']['products'].length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
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
            height: 150,
            margin: EdgeInsets.only(top: 10, bottom: 10),
            alignment: Alignment.center,
            child: OutlineButton(
              onLongPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpdateProduct(
                              name: result.data['product']['products'][index]
                                  ['name'],
                              decs: result.data['product']['products'][index]
                                  ['decs'],
                              price: result.data['product']['products'][index]
                                      ['price']
                                  .toString(),
                              sale_price: result.data['product']['products']
                                      [index]['sale_price']
                                  .toString(),
                              in_price: result.data['product']['products']
                                      [index]['in_price']
                                  .toString(),
                              id: result.data['product']['products'][index]
                                  ['_id'],
                              weight: result.data['product']['products'][index]
                                      ['weight']
                                  .toString(),
                              image: result.data['product']['products'][index]
                                  ['featured_photo']['url'],
                            ))
                    // tags: result.data['product']['products'][index]['tags'][0]['name'])),
                    );
              },
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                        primary: true,
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 8),
                        child: AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0))),
                          contentPadding: EdgeInsets.only(top: 10.0),
                          content: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text("Chi Tiết Sản Phẩm",
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18,
                                    )),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Divider(
                                  color: Colors.grey,
                                  height: 4.0,
                                ),
                                Column(
                                  children: <Widget>[
                                    if (result.data['product']['products']
                                            [index]['featured_photo'] ==
                                        null)
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: new Image.network(
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/No_image_3x4.svg/1280px-No_image_3x4.svg.png",
                                          width: 150,
                                        ),
                                      ),
                                    if (result.data['product']['products']
                                            [index]['featured_photo'] !=
                                        null)
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: new Image.network(
                                          result.data['product']['products']
                                              [index]['featured_photo']['url'],
                                          filterQuality: FilterQuality.high,
                                          matchTextDirection: true,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.8,
                                          height: 140,
                                        ),
                                      ), // ảnh sản phẩm
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              "Tên Sản Phẩm: ",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.5,
                                            padding: EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Text(
                                              result.data['product']['products']
                                                  [index]['name'],
                                              maxLines: 5,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14),
                                            ),
                                          )
                                        ],
                                      ),
                                    ), // Tên Sản phẩm
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              "Giá Nhập: ",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.5,
                                            padding: EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Text(
                                              result.data['product']['products']
                                                          [index]['in_price']
                                                      .toString() +
                                                  " đ",
                                              maxLines: 5,
                                              textAlign: TextAlign.left,
                                            ),
                                          )
                                        ],
                                      ),
                                    ), //Nhập bán Sản Phẩm
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              "Giá Bán: ",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.5,
                                            padding: EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Text(
                                              result.data['product']['products']
                                                          [index]['price']
                                                      .toString() +
                                                  " đ",
                                              maxLines: 5,
                                              textAlign: TextAlign.left,
                                            ),
                                          )
                                        ],
                                      ),
                                    ), //Nhập bán Sản Phẩm
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              "Giá Bán Giảm: ",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.5,
                                            padding: EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Text(
                                              result.data['product']['products']
                                                          [index]['sale_price']
                                                      .toString() +
                                                  " đ",
                                              maxLines: 5,
                                              textAlign: TextAlign.left,
                                            ),
                                          )
                                        ],
                                      ),
                                    ), //Giá Giảm Sản Phẩm

                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              "Mô Tả: ",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.5,
                                            padding: EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Text(
                                              result.data['product']['products']
                                                  [index]['desc'],
                                              maxLines: 5,
                                              textAlign: TextAlign.left,
                                            ),
                                          )
                                        ],
                                      ),
                                    ), // Miêu tả chi tiết
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              "Loại: ",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.5,
                                            padding: EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Text(
                                              result.data['product']['products']
                                                  [index]['tags'][0]['name'],
                                              maxLines: 5,
                                              textAlign: TextAlign.left,
                                            ),
                                          )
                                        ],
                                      ),
                                    ), // Trọng Lượn
                                    // Loại Sản Phẩm
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              "Trọng Lượng: ",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.5,
                                            padding: EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Text(
                                              result.data['product']['products']
                                                          [index]['weight']
                                                      .toString() +
                                                  " kg",
                                              maxLines: 5,
                                              textAlign: TextAlign.left,
                                            ),
                                          )
                                        ],
                                      ),
                                    ), // Trọng Lượn
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              "số Lượng: ",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.5,
                                            padding: EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Text(
                                              // result.data['stock']
                                              //         ['imports'][index]
                                              //         ['items_detail'][0]
                                              //         ['qty']
                                              //     .toString(),
                                              "Đang Cập Nhật",
                                              maxLines: 5,
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ), // Trọng Lượn
                                  ],
                                ),
                                Divider(
                                  color: Colors.grey,
                                  height: 4.0,
                                ),
                                Center(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
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
                                                color: Colors.black
                                                    .withOpacity(0.15),
                                                offset: Offset(0.8, 10.0),
                                                blurRadius: 9.0,
                                                spreadRadius: 2.0,
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Text(
                                          "OK",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w300),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  if (result.data['product']['products'][index]
                          ['featured_photo'] ==
                      null)
                    Container(
                      child: new Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/No_image_3x4.svg/1280px-No_image_3x4.svg.png",
                        width: 150,
                      ),
                    ),
                  if (result.data['product']['products'][index]
                          ['featured_photo'] !=
                      null)
                    new Image.network(
                      result.data['product']['products'][index]
                          ['featured_photo']['url'],
                      filterQuality: FilterQuality.high,
                      matchTextDirection: true,
                      width: MediaQuery.of(context).size.width / 2.8,
                      height: 140,
                    ),
                  Container(
                    padding: EdgeInsets.only(left: 30),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        (result.data['product']['products'][index]['name']),
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff716767),
                        ),
                      ),
                      if (result.data['product']['products'][index]
                                  ['sale_price'] ==
                              null ||
                          result.data['product']['products'][index]
                                  ['sale_price'] ==
                              0.1)
                        new Text(
                          (result.data['product']['products'][index]['price']
                                  .toString() +
                              " đ"),
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff716767),
                          ),
                        ),
                      if (result.data['product']['products'][index]
                                  ['sale_price'] !=
                              null &&
                          result.data['product']['products'][index]
                                  ['sale_price'] !=
                              0.1)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text(
                              (result.data['product']['products'][index]
                                          ['price']
                                      .toString() +
                                  " đ"),
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff716767),
                              ),
                            ),
                            new Text(
                              (result.data['product']['products'][index]
                                          ['sale_price']
                                      .toString() +
                                  " đ"),
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff716767),
                              ),
                            ),
                          ],
                        )
                    ],
                  ),
                  new Expanded(child: Container()),
                  new Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black26,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class PhanLoai extends StatefulWidget {
  PhanLoai({
    Key key,
    @required String selectPhanloai,
    @required List<String> phanloai,
  })  : _selectPhanloai = selectPhanloai,
        _phanloai = phanloai,
        super(key: key);

  String _selectPhanloai;
  final List<String> _phanloai;

  @override
  _PhanLoaiState createState() => _PhanLoaiState();
}

class _PhanLoaiState extends State<PhanLoai> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width / 1.3,
      margin: EdgeInsets.all(10),
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
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.sort),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 20.0),
            child: Text(
              'Phân Loại Theo ',
              style: TextStyle(
                color: Color(0xff716767),
              ),
            ),
          ),
          Expanded(
            // add Expanded to have your dropdown button fill remaining space
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                // this allows your dropdown icon to be visible
                value: widget._selectPhanloai,
                iconSize: 24,
                style: TextStyle(
                  color: Color(0xff716767),
                ),
                items: widget._phanloai.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item, overflow: TextOverflow.ellipsis),
                  );
                }).toList(),
                onChanged: (String value) {
                  setState(() {
                    widget._selectPhanloai = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
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
            hintText: "Bạn Muốn Tìm Gì ?",
            labelText: 'Tìm Kiếm Tên, Mã Sản Phẩm ....',
          ),
        ),
      ),
    );
  }
}
