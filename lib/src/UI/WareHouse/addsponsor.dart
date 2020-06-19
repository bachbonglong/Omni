import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:duan_cntt2/src/constants/constants.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class AddSponsor extends StatefulWidget {
  AddSponsor({Key key}) : super(key: key);

  @override
  _AddSponsor createState() => _AddSponsor();
}

class _AddSponsor extends State<AddSponsor> {
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
              "Thêm Nhà Cung Cấp",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
            )),
        body: Container(
          height: 1000,
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
                    margin: EdgeInsets.only(left: 10, right: 10,top:100),
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        FromField1(),
                        new Container(padding: EdgeInsets.only(top: 20)),
                        FromField2(),
                        new Container(padding: EdgeInsets.only(top: 20)),
                        FromField3(),
                        new Container(padding: EdgeInsets.only(top: 20)),
                        FromField4(),
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
            Navigator.pushNamed(context, Constants.sponsor);
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
                'Thêm Mới',
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
            labelText: 'Tên Nhà Cung Cấp',
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
          keyboardType: TextInputType.number,
          maxLines: 1,
          decoration: new InputDecoration(
            border: OutlineInputBorder(),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            labelText: 'Số điện thoại',
            hintText: "Hãy Nhập Số Điện Thoại của Nhà Cung Cấp",
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
            hintText: "Nhập Email nhà cung cấp",
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
            border: OutlineInputBorder(),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            labelText: 'Địa chỉ',
            hintText: "Nhập địa chỉ nhà cung cấp",
          ),
        ),
      ),
    );
  }
}
