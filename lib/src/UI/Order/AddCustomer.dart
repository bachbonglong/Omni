import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:duan_cntt2/src/constants/constants.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class AddCustomer extends StatefulWidget {
  AddCustomer({Key key}) : super(key: key);

  @override
  _AddCustomer createState() => _AddCustomer();
}

class _AddCustomer extends State<AddCustomer> {
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
              "Thêm Khách hàng",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.all(15),
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.grey.shade400, width: 0.7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                    Text("Thêm Ảnh Khách Hàng")
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
                            ChoiceType(),
                            new Container(padding: EdgeInsets.only(top: 20)),
                          ],
                        ),
                      ),
                      new Container(padding: EdgeInsets.only(top: 20)),
                      ButtonSubmit()
                    ],
                  ),
                ))));
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
            Navigator.pushNamed(context, Constants.customer);
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
                'Thêm Khách hàng',
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
            labelText: 'Nhập Tên Khách Hàng',
            hintText: "Hãy Nhập Tên Khách Hàng Bạn Muốn Thêm Vào",
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
            labelText: 'Nhập Số Điện Thoại',
            hintText: "Hãy Nhập Số Điện Thoại Khách Hàng",
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
            labelText: 'Email',
            hintText: "Nhập Email Khách Hàng ( Khôn Bắt Buộc )",
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
          keyboardType: TextInputType.text,
          decoration: new InputDecoration(
            suffixIcon: Icon(Icons.monetization_on),
            border: OutlineInputBorder(),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            labelText: 'Địa Chỉ',
            hintText: "Nhập Địa Chỉ Khách Hàng",
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
        Navigator.pushNamed(context, Constants.city);
      },
      child: new Container(
        height: 50,
        decoration: BoxDecoration(),
        alignment: Alignment.centerLeft,
        child: Container(child: Text("Khu Vực", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),)),
      ),
    );
  }
}
