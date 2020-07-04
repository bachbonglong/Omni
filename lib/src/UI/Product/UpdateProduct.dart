import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:http_parser/http_parser.dart';
// import 'package:http/http.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:duan_cntt2/src/API/mutation.dart';

class UpdateProduct extends StatefulWidget {
  UpdateProduct(
      {Key key,
      this.name,
      this.decs,
      this.price,
      this.id,
      this.weight,
      this.image,
      // this.tags,
      // ignore: non_constant_identifier_names
      this.sale_price,
      // ignore: non_constant_identifier_names
      this.in_price})
      : super(key: key);

  final String name;
  final String decs;
  final String price;
  // ignore: non_constant_identifier_names
  final String sale_price;
  // ignore: non_constant_identifier_names
  final String in_price;
  final String id;
  // final String tags;
  final String image;
  final String weight;

  @override
  _UpdateProduct createState() => _UpdateProduct();
}

class _UpdateProduct extends State<UpdateProduct> {
  final TextEditingController _nameSamPham = TextEditingController();
  final TextEditingController _moTaSanPham = TextEditingController();
  final TextEditingController _giaBanLe = TextEditingController();
  final TextEditingController _giaGiam = TextEditingController();
  final TextEditingController _giaNhap = TextEditingController();
  final TextEditingController _urlSanpham = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  // ignore: unused_field
  bool _uploadInProgress = false;

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
                        documentNode: gql(updatProduct),
                        update: (Cache cache, QueryResult result) {
                          print("DA NHAP THANH CONG");
                          return cache;
                        },
                        onError: (error) => print(error),
                        onCompleted: (dynamic resultdata) {
                          print("DA UPDATE THÀNH CÔNG");
                          Navigator.pop(context);
                        },
                      ),
                      builder: (RunMutation updateProduct,
                          QueryResult resultUpdate) {
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
                                    labelText: widget.name,
                                    hintText: "Hãy Sửa Tên Sản Phẩm",
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
                                    labelText: widget.decs,
                                    hintText: "Hãy Sửa Mô Tả Sản Phẩm",
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
                                    labelText: widget.price,
                                    hintText: "Hãy Sửa Giá Bán Lẻ Sản Phẩm",
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
                                    labelText: widget.sale_price,
                                    hintText: "Hãy Sửa Giá Giảm Sản Phẩm",
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
                                  controller: _weight,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  decoration: new InputDecoration(
                                    suffixIcon: Icon(Icons.wb_auto),
                                    border: OutlineInputBorder(),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    labelText: widget.weight + " kg",
                                    hintText: "Hãy Sửa Cân Nặng Sản Phẩm",
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
                                    labelText: widget.in_price,
                                    hintText: "Hãy Sửa Giá Nhập Sản Phẩm",
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
                                  controller: _urlSanpham,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.url,
                                  decoration: new InputDecoration(
                                    border: OutlineInputBorder(),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    labelText: widget.image,
                                    hintText: "Sửa lại đường link",
                                  ),
                                ),
                              ),
                              new Container(
                                padding: EdgeInsets.only(top: 20),
                              ),
                              new Container(padding: EdgeInsets.only(top: 20)),
                              Center(
                                child: new Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  height: 50.0,
                                  child: GestureDetector(
                                    onTap: () {
                                      updateProduct(<String, dynamic>{
                                        'id': widget.id,
                                        'name': _nameSamPham.text,
                                        'price': double.parse(_giaBanLe.text),
                                        'desc': _moTaSanPham.text,
                                        'sale_price':
                                            double.parse(_giaGiam.text),
                                        'in_price': double.parse(_giaNhap.text),
                                        'weight': double.parse(_weight.text)
                                        // 'photo_urls':[_urlSanpham.text],
                                      });
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
