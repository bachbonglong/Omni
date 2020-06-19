import 'package:duan_cntt2/src/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class TypeProduct extends StatefulWidget {
  TypeProduct({Key key}) : super(key: key);

  @override
  _TypeProductState createState() => _TypeProductState();
}

Color myColor = Color(0xff00bfa5);

class _TypeProductState extends State<TypeProduct> {
  // final _formKey = GlobalKey<FormState>();
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
        title: Row(
          children: <Widget>[             
            Text('Loại sản phẩm', // kéo nó ra giữa 
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 27,
                      color: (const Color(0xff413b3b)),
                      
                    ),
                    
                    ),
      
            
            new Expanded(child: Container()),
            FloatingActionButton(
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
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0))),
                        contentPadding: EdgeInsets.only(top: 10.0),
                        content: Container(
                          width: 500.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    "Thêm Loại Sản Phẩm",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Divider(
                                color: Colors.grey,
                                height: 4.0,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 30.0, right: 30.0, top: 30.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Thêm Loại Sản Phẩm",
                                    border: InputBorder.none,
                                  ),
                                  maxLines: 8,
                                ),
                              ),
                              Divider(
                                color: Colors.grey,
                                height: 4.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
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
                                            color: Color(0xffffffff),
                                            boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.15),
                                                  offset: Offset(0.8, 10.0),
                                                  blurRadius: 9.0,
                                                  spreadRadius: 2.0,
                                                ),
                                              ],
                                            borderRadius:
                                                BorderRadius.circular(50 )),
                                        child: Text(
                                          "Huỷ",
                                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300,),
                                          textAlign: TextAlign.center,
                                          
                                        ),
                                      ),
                                    ),
                                  ),
                                  new Expanded(child: Container()),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    padding: EdgeInsets.all(15),
                                    child: InkWell(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                          top: 20.0,
                                          bottom: 20.0,
                                        ),
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
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Text(
                                          "Thêm",
                                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300,),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
            )
          ],
        ),
      ),
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
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10),
                  
                ),
                new Container(padding: EdgeInsets.all(10)),
                Container(child: Search()),
                new Container(padding: EdgeInsets.all(10)),
                Type1(),
                Type2(),
                Type3(),
                Type1(),
                Type2(),
                Type3(),
                Type1(),
                Type2(),
                Type3(),
              ],
            ),
          ),
        ),
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
      onPressed: (){
       Navigator.pushNamed(context,Constants.qrcamera);
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
            labelText: 'Tìm Kiếm Tên Loại Sản Phẩm ....',
          ),
        ),
      ),
    );
  }
}

class Type1 extends StatelessWidget {
  const Type1({
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
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Quần Nam",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                        
                        ),
                    )),
                Icon(Icons.arrow_back_ios),
                Container()
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.amber,
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade400),
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

class Type2 extends StatelessWidget {
  const Type2({
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
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Quần Nữ",
                      style: TextStyle(fontSize: 25,
                        fontWeight: FontWeight.w300,),
                    )),
                Icon(Icons.arrow_back_ios),
                Container()
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.amber,
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade400),
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

class Type3 extends StatelessWidget {
  const Type3({
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
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Áo Nam",
                      style: TextStyle(fontSize: 25,
                        fontWeight: FontWeight.w300,),
                    )),
                Icon(Icons.arrow_back_ios),
                Container()
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.amber,
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade400),
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
