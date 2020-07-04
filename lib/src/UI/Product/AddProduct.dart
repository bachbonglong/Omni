import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:duan_cntt2/src/constants/constants.dart';
// import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:http_parser/http_parser.dart';
// import 'package:http/http.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:duan_cntt2/src/API/mutation.dart';

class AddProduct extends StatefulWidget {
  AddProduct({@required this.client});

  final GraphQLClient client;
  @override
  _AddProduct createState() => _AddProduct();
}

class _AddProduct extends State<AddProduct> {
  final TextEditingController _nameSamPham = TextEditingController();
  final TextEditingController _moTaSanPham = TextEditingController();
  final TextEditingController _giaBanLe = TextEditingController();
  final TextEditingController _giaGiam = TextEditingController();
  final TextEditingController _giaNhap = TextEditingController();
  final TextEditingController _anhSanPham = TextEditingController();
  final TextEditingController _weightSanPham = TextEditingController();
  final TextEditingController _tagSanPham = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  // ignore: unused_field
  File _image;

  final picker = ImagePicker();

  Future getImageGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  Future getImageCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  bool _validate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            title: Text(
              "Thêm Sản Phẩm",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
            )),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/src/res/img/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    alignment: Alignment.center,
                    decoration: new BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(0.4, 0.5),
                          blurRadius: 9.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                      color: Colors.white,
                      border:
                          Border.all(color: Colors.grey.shade400, width: 0.7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Mutation(
                      options: MutationOptions(
                        documentNode: gql(addProduct),
                        update: (Cache cache, QueryResult result) {
                          print("DA UPDATE SAN PHAM");
                          return cache;
                        },
                        onError: (error) => print(error),
                        onCompleted: (dynamic resultdata) {
                          print("DA NHAP THANH CONG");
                          Navigator.pop(context);
                        },
                      ),
                      builder: (RunMutation insert, QueryResult result) {
                        return Form(
                          key: _formKey,
                          autovalidate: _validate,
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 120,
                                padding: EdgeInsets.only(top: 10),
                                child: FlatButton(
                                  onPressed: () => getImageGallery(),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        child: Icon(
                                          Icons.camera_alt,
                                          size: 80,
                                        ),
                                      ),
                                      Text(
                                        "Thêm Ảnh Sản Phẩm",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 80,
                                margin: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey.shade400),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: TextField(
                                  controller: _nameSamPham,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  maxLines: 1,
                                  decoration: new InputDecoration(
                                    border: OutlineInputBorder(),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    labelText: 'Nhập Tên Sản Phẩm',
                                    hintText:
                                        "Hãy Nhập Tên Sản Phẩm Bạn Muốn Thêm Vào",
                                  ),
                                ),
                              ),
                              new Container(padding: EdgeInsets.only(top: 20)),
                              Container(
                                height: 80,
                                margin: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey.shade400),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: TextField(
                                  controller: _moTaSanPham,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  decoration: new InputDecoration(
                                    border: OutlineInputBorder(),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    labelText: 'Mô Tả Sản Phẩm',
                                    hintText: "Mô Tả Chi Tiết Cho Sản Phẩm",
                                  ),
                                ),
                              ),
                              new Container(padding: EdgeInsets.only(top: 20)),
                              Container(
                                height: 80,
                                margin: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey.shade400),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: TextField(
                                  controller: _tagSanPham,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  decoration: new InputDecoration(
                                    border: OutlineInputBorder(),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    labelText: 'Loại Sản Phẩm',
                                    hintText: "Nhập Loại Sản Phẩm",
                                  ),
                                ),
                              ),
                              new Container(padding: EdgeInsets.only(top: 20)),
                              Container(
                                height: 80,
                                margin: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey.shade400),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: TextField(
                                  controller: _weightSanPham,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  decoration: new InputDecoration(
                                    border: OutlineInputBorder(),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    labelText: 'Trọng Lượng Sản Phẩm',
                                    hintText: "Nhập Trọng Lượng Cho Sản Phẩm",
                                  ),
                                ),
                              ),
                              new Container(padding: EdgeInsets.only(top: 20)),
                              Container(
                                height: 80,
                                margin: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey.shade400),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: TextField(
                                  controller: _giaBanLe,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.number,
                                  decoration: new InputDecoration(
                                    suffixIcon: Icon(Icons.monetization_on),
                                    border: OutlineInputBorder(),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    labelText: 'Giá Bán Lẻ',
                                    hintText: "Nhập Giá Bán Lẻ Sản Phẩm",
                                  ),
                                ),
                              ),
                              new Container(padding: EdgeInsets.only(top: 20)),
                              Container(
                                height: 80,
                                margin: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey.shade400),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: TextField(
                                  controller: _giaGiam,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.number,
                                  decoration: new InputDecoration(
                                    suffixIcon: Icon(Icons.monetization_on),
                                    border: OutlineInputBorder(),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    labelText: 'Giá Giảm ( Nếu Có )',
                                    hintText: "Nhập Giá Giảm Cho Sản Phẩm",
                                  ),
                                ),
                              ),
                              new Container(padding: EdgeInsets.only(top: 20)),
                              Container(
                                height: 80,
                                margin: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey.shade400),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: TextField(
                                  controller: _giaNhap,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.number,
                                  decoration: new InputDecoration(
                                    suffixIcon: Icon(Icons.monetization_on),
                                    border: OutlineInputBorder(),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    labelText: 'Giá Nhập',
                                    hintText: "Nhập Giá Nhập Cho Sản Phẩm",
                                  ),
                                ),
                              ),
                              new Container(
                                padding: EdgeInsets.only(top: 20),
                              ),
                              Container(
                                height: 80,
                                margin: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey.shade400),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: TextField(
                                  controller: _anhSanPham,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  decoration: new InputDecoration(
                                    suffixIcon: Icon(Icons.image),
                                    border: OutlineInputBorder(),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    labelText: 'Thêm URL ảnh',
                                    hintText: "Nhập url ảnh Cho Sản Phẩm",
                                  ),
                                ),
                              ),
                              new Container(padding: EdgeInsets.only(top: 20)),
                              Center(
                                child: new Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  height: 50.0,
                                  child: GestureDetector(
                                    onTap: () {
                                      Map<String, dynamic> pr = {
                                        'name': _nameSamPham.text,
                                        'price': double.parse(_giaBanLe.text),
                                        'desc': _moTaSanPham.text,
                                        'sale_price':
                                            double.parse(_giaGiam.text),
                                        'in_price': double.parse(
                                          _giaNhap.text,
                                        ),
                                        'weight':
                                            double.parse(_weightSanPham.text),
                                      };
                                      insert(pr);
                                    },
                                    child: Container(
                                      width: (136),
                                      height: (50),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment(0.7, 0.2),
                                          end: Alignment(0.2, 2),
                                          colors: [
                                            const Color(0xffff9a9e),
                                            const Color(0xfffad0c4)
                                          ],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular((24)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Thêm sản phẩm',
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
                              ),
                              new Container(padding: EdgeInsets.only(top: 20)),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )));
  }
}
