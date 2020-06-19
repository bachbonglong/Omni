import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:duan_cntt2/src/constants/constants.dart';

class AddOrderHad extends StatefulWidget {
  AddOrderHad({Key key}) : super(key: key);

  @override
  _AddOrderHad createState() => _AddOrderHad();
}

class _AddOrderHad extends State<AddOrderHad> {
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
                showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0))),
                contentPadding: EdgeInsets.only(top: 10.0),
                content: Container(
                  width: 500.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Huỷ Tạo Đơn Hàng",
                            style: TextStyle(fontSize: 20.0,color: Colors.pink[500]),
                            
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
                      Container(padding: EdgeInsets.all(20),height: 100,child: Text("Bạn vẫn chưa hoàn thành xong đơn hàng bạn có muốn huỷ đơn hàng",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,)),),
                      Divider(
                        color: Colors.grey,
                        height: 4.0,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 200,
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
                                              color: Colors.black.withOpacity(0.15),
                                              offset: Offset(0.8, 10.0),
                                              blurRadius: 9.0,
                                              spreadRadius: 2.0,
                                            ),
                                          ],
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "Thoát",
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          new Expanded(child: Container()),
                          Container(
                            width: 200,
                            padding: EdgeInsets.all(15),
                            child: InkWell(
                              onTap: (){Navigator.pushNamed(context, Constants.order);  },
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
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "Đồng Ý",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
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
            ),
            title: Text(
              "Thêm Sản Phẩm",
              style: TextStyle(color: Colors.black),
            )),
        body: Container(
            color: Hexcolor('#FBFCF6'),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 120,
                    padding: EdgeInsets.only(top: 10),
                    child: FlatButton(
                      onPressed: () {                        Navigator.pushNamed(context, Constants.qrcamera);
},
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Icon(
                              FontAwesomeIcons.qrcode,
                              size: 80,
                            ),
                          ),
                          Text("Quét Sản Phẩm Bằng QR CODE")
                        ],
                      ),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        AddProductHad(),
                        new Container(padding: EdgeInsets.only(top: 100)),
                        TableRow1(),
                        new Container(padding: EdgeInsets.only(top: 20)),
                        TableRow2(),
                        new Container(padding: EdgeInsets.only(top: 20)),
                        TableRow3(),
                        new Container(padding: EdgeInsets.only(top: 20)),
                        TableRow4(),
                        new Container(padding: EdgeInsets.only(top: 40)),
                        AddNote(),
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

class AddProductHad extends StatefulWidget {
  const AddProductHad({
    Key key,
  }) : super(key: key);

  @override
  _AddProductHad createState() => _AddProductHad();
}

class _AddProductHad extends State<AddProductHad> {
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.text = "0"; // Setting the initial value for the field.
  }

  Widget build(BuildContext context) {
    return new Container(
        height: 150,
        width: MediaQuery.of(context).size.width / 1.1,
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: new BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.pinkAccent, width: 5),
          borderRadius: BorderRadius.circular(30),
        ),
        child: OutlineButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(25.0)),
          borderSide: BorderSide(color: Colors.red),
          onPressed: () {},
          child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Container(
              height: 100,
              child: new Image.network(
                  "https://product.hstatic.net/1000088324/product/2__2__128daeaf24aa421ab7f3868a1acbae6f_master.png"),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    "Áo TeenWorld",
                    style: TextStyle(fontSize: 20),
                  ),
                  new Container(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  new Text("Mã Sản Phẩm : 0124"),
                  new Container(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  new Text("Giá Thành: 60.000đ"),
                ],
              ),
            ),
            new Expanded(child: Container()),
            Row(children: <Widget>[
              SizedBox(
                width: 80,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  controller: _controller,
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: false,
                    signed: true,
                  ),
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                ),
              ),
              Container(
                height: 38.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: InkWell(
                        child: Icon(
                          Icons.arrow_drop_up,
                          size: 18.0,
                        ),
                        onTap: () {
                          int currentValue = int.parse(_controller.text);
                          setState(() {
                            currentValue++;
                            _controller.text =
                                (currentValue).toString(); // incrementing value
                          });
                        },
                      ),
                    ),
                    InkWell(
                      child: Icon(
                        Icons.arrow_drop_down,
                        size: 18.0,
                      ),
                      onTap: () {
                        int currentValue = int.parse(_controller.text);
                        setState(() {
                          currentValue--;
                          _controller.text =
                              (currentValue > 0 ? currentValue : 0)
                                  .toString(); // decrementing value
                        });
                      },
                    ),
                  ],
                ),
              )
            ]),
          ]),
        ));
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
                Text("Tổng số lượng", style: TextStyle(fontSize: 20)),
                Row(
                  children: <Widget>[
                    Text("2", style: TextStyle(fontSize: 20)),
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
                Text("Tổng tiền hàng", style: TextStyle(fontSize: 20)),
                Row(
                  children: <Widget>[
                    Text("100.000đ", style: TextStyle(fontSize: 20)),
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
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Khách Hàng", style: TextStyle(fontSize: 20)),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    )
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
        Navigator.pushNamed(context, Constants.customer);
      },
    );
  }
}

class TableRow4 extends StatelessWidget {
  const TableRow4({
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
                Text("Phương Thức Thanh Toán", style: TextStyle(fontSize: 20)),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    )
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

class TableRow5 extends StatelessWidget {
  const TableRow5({
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
                Text("Phương Thức Thanh Toán", style: TextStyle(fontSize: 20)),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    )
                  ],
                ),
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.only(left: 10, right: 10),
          )
        ],
      ),
      onTap: () {
        print('Work1');
      },
    );
  }
}

class ButtonSubmit extends StatelessWidget {
  const ButtonSubmit({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 50.0,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Constants.product);
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFF05A22),
              style: BorderStyle.solid,
              width: 1.0,
            ),
            gradient: LinearGradient(
                end: Alignment.topRight,
                begin: Alignment.bottomLeft,
                colors: [Colors.white, Colors.red[300]]),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  "Tạo đơn hàng",
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
      ),
    );
  }
}

class AddOrderBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {
        Navigator.pushNamed(context, Constants.addproductorder);
      },
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(15.0)),
      child: new Container(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Thêm Sản Phẩm",
                style: TextStyle(fontSize: 20),
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
}

class AddNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0))),
                contentPadding: EdgeInsets.only(top: 10.0),
                content: Container(
                  width: 500.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Thêm Ghi Chú",
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
                        padding:
                            EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Ghi thêm ghi chú cho người giao hàng ",
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
                            width: 200,
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
                                        color: Colors.black.withOpacity(0.15),
                                        offset: Offset(0.8, 10.0),
                                        blurRadius: 9.0,
                                        spreadRadius: 2.0,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "Huỷ",
                                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          new Expanded(child: Container()),
                          Container(
                            width: 200,
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
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "Thêm Ghi Chú",
                                  style: TextStyle(color:  Colors.black,fontWeight: FontWeight.w300),
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
      child: new Container(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Thêm Ghi Chú",
                style: TextStyle(fontSize: 20),
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
}
