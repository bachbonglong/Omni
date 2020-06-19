import 'package:duan_cntt2/src/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AddProductOrder extends StatefulWidget {
  AddProductOrder({Key key}) : super(key: key);

  @override
  _AddProductOrder createState() => _AddProductOrder();
}

class _AddProductOrder extends State<AddProductOrder>
    with SingleTickerProviderStateMixin {
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
  ]; // Option 2
  String _selectPhanloai; // Option 2
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Hexcolor("#FFFFFF"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          child: Text(
            'Thêm Sản Phẩm',
            style: TextStyle(
              fontFamily: ('Jura'),
              fontSize: 27,
              fontWeight: FontWeight.w300,
              color: (const Color(0xff413b3b)),
            ),
          ),
        ),
      ),
      body: Container(
        height: 1000,
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
                Container(child: Search()),
                new Container(padding: EdgeInsets.all(10)),
                PhanLoai(selectPhanloai: _selectPhanloai, phanloai: _phanloai),
                new Container(padding: EdgeInsets.all(10)),
                ListProduct(),
                new Container(padding: EdgeInsets.all(10)),
                ListProduct1(),
                new Container(padding: EdgeInsets.all(10)),
                ButtonSubmit(),
                new Container(padding: EdgeInsets.all(10)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListProduct extends StatefulWidget {
  const ListProduct({
    Key key,
  }) : super(key: key);

  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  bool choice = true;
  tap() {
    setState(() {
      choice = !choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 150,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: choice ? Colors.white : Colors.greenAccent,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: Offset(0.8, 10.0),
            blurRadius: 9.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: OutlineButton(
        onPressed: tap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 100,
              child: new Image.network(
                  "https://product.hstatic.net/1000088324/product/2__2__128daeaf24aa421ab7f3868a1acbae6f_master.png"),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "Áo Thun TeenWoorld",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                ),
                new Text(
                  "Giá Nhập",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                ),
                new Text(
                  "Số lượng có trong kho",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            new Expanded(child: Container()),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                new Text(
                  "",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                ),
                new Text(
                  "50.000đ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                ),
                new Text(
                  "50 cái",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ListProduct1 extends StatefulWidget {
  const ListProduct1({
    Key key,
  }) : super(key: key);

  @override
  _ListProduct1State createState() => _ListProduct1State();
}

class _ListProduct1State extends State<ListProduct1> {
  bool choice = true;
  tap() {
    setState(() {
      choice = !choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 150,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: choice ? Colors.white : Colors.greenAccent,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: Offset(0.8, 10.0),
            blurRadius: 9.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: OutlineButton(
        onPressed: tap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 100,
              child: new Image.network(
                  "https://product.hstatic.net/1000088324/product/tw119t-t_l2_5eb8ec6611d843ae83a8460a0aac8399_grande.jpg"),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "Áo Thun TeenWoorld",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                ),
                new Text(
                  "Giá Nhập",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                ),
                new Text(
                  "Số lượng có trong kho",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            new Expanded(child: Container()),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                new Text(
                  "",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                ),
                new Text(
                  "100.000đ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                ),
                new Text(
                  "50 cái",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
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
            child: Text('Phân Loại Theo :'),
          ),
          Expanded(
            // add Expanded to have your dropdown button fill remaining space
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded:
                    true, // this allows your dropdown icon to be visible
                value: widget._selectPhanloai,
                iconSize: 24,
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
    return new Container(
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
    );
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
            Navigator.pushNamed(context, Constants.addproducthad);
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
                'Xong',
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
