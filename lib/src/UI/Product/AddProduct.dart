import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:duan_cntt2/src/constants/constants.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class AddProduct extends StatefulWidget {
  AddProduct({Key key}) : super(key: key);

  @override
  _AddProduct createState() => _AddProduct();
}

class _AddProduct extends State<AddProduct> {
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
            title: Text(
              "Thêm Sản Phẩm",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
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
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 120,
                          padding: EdgeInsets.only(top: 10),
                          child: FlatButton(
                            onPressed: () {},
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 80,
                                  ),
                                ),
                                Text("Thêm Ảnh Sản Phẩm" , style: TextStyle(fontWeight: FontWeight.w400),)
                              ],
                            ),
                          ),
                        ),
                        FromField1(),
                        new Container(padding: EdgeInsets.only(top: 20)),
                        FromField2(),
                        new Container(padding: EdgeInsets.only(top: 20)),
                        FromField3(),
                        new Container(padding: EdgeInsets.only(top: 20)),
                        FromField4(),
                        new Container(padding: EdgeInsets.only(top: 20)),
                        FromField5(),
                        new Container(padding: EdgeInsets.only(top: 20)),
                        FromField6(),
                        new Container(padding: EdgeInsets.only(top: 20)),
                        FromField7(),
                        new Container(padding: EdgeInsets.only(top: 20)),
                        FromField8(),
                        new Container(padding: EdgeInsets.only(top: 20)),
                        FromField9(),
                        new Container(padding: EdgeInsets.only(top: 20)),
                        ChoiceType(),
                        new Container(padding: EdgeInsets.only(top: 20)),
                      ],
                    ),
                  ),
                  new Container(padding: EdgeInsets.only(top: 20)),
                  ButtonSubmit()
                ],
              ),
            )));
  }
}

class ButtonSubmit extends StatelessWidget {
  const ButtonSubmit({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Container(
        width: MediaQuery.of(context).size.width / 2.5,
        height: 50.0,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Constants.product);
          },
          child: Container(
            width: (136),
            height: (50),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.7, 0.2),
                end: Alignment(0.2, 2),
                colors: [const Color(0xffff9a9e), const Color(0xfffad0c4)],
              ),
              borderRadius: BorderRadius.circular((24)),
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
    );
  }
}

class FromField1 extends StatelessWidget {
  const FromField1({
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
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade400),
          ),
        ),
        alignment: Alignment.center,
        child: TextField(
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
            hintText: "Hãy Nhập Tên Sản Phẩm Bạn Muốn Thêm Vào",
          ),
        ),
      ),
    );
  }
}

class FromField2 extends StatelessWidget {
  const FromField2({
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
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade400),
          ),
        ),
        alignment: Alignment.center,
        child: TextField(
          cursorColor: Colors.black,
          keyboardType: TextInputType.text,
          maxLines: 1,
          decoration: new InputDecoration(
            border: OutlineInputBorder(),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            labelText: 'Nhập Mã Sản Phẩm',
            hintText: "Hãy Nhập Mã Sản Phẩm Cho Sản Phẩm",
          ),
        ),
      ),
    );
  }
}

class FromField3 extends StatelessWidget {
  const FromField3({
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
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade400),
          ),
        ),
        alignment: Alignment.center,
        child: TextField(
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
    );
  }
}

class FromField4 extends StatelessWidget {
  const FromField4({
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
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade400),
          ),
        ),
        alignment: Alignment.center,
        child: TextField(
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
    );
  }
}

class FromField5 extends StatelessWidget {
  const FromField5({
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
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade400),
          ),
        ),
        alignment: Alignment.center,
        child: TextField(
          cursorColor: Colors.black,
          keyboardType: TextInputType.number,
          decoration: new InputDecoration(
            suffixIcon: Icon(Icons.monetization_on),
            border: OutlineInputBorder(),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            labelText: 'Giá Bán Buôn Bán',
            hintText: "Nhập Giá Buôn Bán Cho Sản Phẩm",
          ),
        ),
      ),
    );
  }
}

class FromField6 extends StatelessWidget {
  const FromField6({
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
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade400),
          ),
        ),
        alignment: Alignment.center,
        child: TextField(
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
    );
  }
}

class FromField7 extends StatelessWidget {
  const FromField7({
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
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade400),
          ),
        ),
        alignment: Alignment.center,
        child: TextField(
          cursorColor: Colors.black,
          keyboardType: TextInputType.number,
          decoration: new InputDecoration(
            suffixIcon: Container(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "nhập",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w100,
                  ),
                )),
            border: OutlineInputBorder(),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            labelText: 'Kích thước ',
            hintText: "Nhập kích thước Cho Sản Phẩm",
          ),
        ),
      ),
    );
  }
}

class FromField8 extends StatelessWidget {
  const FromField8({
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
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade400),
          ),
        ),
        alignment: Alignment.center,
        child: TextField(
          cursorColor: Colors.black,
          keyboardType: TextInputType.number,
          decoration: new InputDecoration(
            suffixIcon: Container(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "nhập",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w100,
                  ),
                )),
            border: OutlineInputBorder(),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            labelText: 'Màu Sắc',
            hintText: "Nhập màu sắc cho sản phẩm",
          ),
        ),
      ),
    );
  }
}

class FromField9 extends StatelessWidget {
  const FromField9({
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
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade400),
          ),
        ),
        alignment: Alignment.center,
        child: TextField(
          cursorColor: Colors.black,
          keyboardType: TextInputType.number,
          decoration: new InputDecoration(
            suffixIcon: Container(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "nhập",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w100,
                  ),
                )),
            border: OutlineInputBorder(),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            labelText: 'Chất Liệu',
            hintText: "Nhập chất liệu cho sản phẩm",
          ),
        ),
      ),
    );
  }
}

class ChoiceType extends StatelessWidget {
  const ChoiceType({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.pushNamed(context, Constants.typeproduct);
      },
      child: new Container(
        height: 50,
        decoration: BoxDecoration(),
        alignment: Alignment.centerLeft,
        child: Container(child: Text("Chọn Loại Sản Phẩm", 
        style: TextStyle(
          fontSize: (20), 
          fontWeight: FontWeight.w300),
          )),
      ),
    );
  }
}
