import 'package:duan_cntt2/src/constants/constants.dart';
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
      body: Query(
          options: QueryOptions(
            documentNode: gql(products),
            variables: {},
          ),
          builder: (QueryResult result,
              {VoidCallback refetch, FetchMore fetchMore}) {
            if (result.loading) {
              return Center(child: CircularProgressIndicator());
            }
            if (result.data == 1) {
              print(result.data);
              print(result.exception);
              return Center(
                child: Column(
                  children: <Widget>[
                    Text("Không có Data"),
                  ],
                ),
              );
            }
            if (result.data == null) {
              return Container(
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
                        PhanLoai(
                            selectPhanloai: _selectPhanloai,
                            phanloai: _phanloai),
                        new Container(padding: EdgeInsets.all(10)),
                      ],
                    ),
                  ),
                ),
              );
            }
            return Container();
          }),
    );
  }
}

// class ListProduct extends StatelessWidget {
//   const ListProduct({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.15),
//             offset: Offset(0.8, 10.0),
//             blurRadius: 9.0,
//             spreadRadius: 2.0,
//           ),
//         ],
//       ),
//       height: 150,
//       margin: EdgeInsets.only(top: 10, bottom: 10),
//       alignment: Alignment.center,
//       child: OutlineButton(
//         onPressed: () {},
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Container(
//               height: 130,
//               child: new Image.network(
//                   "https://product.hstatic.net/1000088324/product/2__2__128daeaf24aa421ab7f3868a1acbae6f_master.png"),
//             ),
//             new Expanded(child: Container()),
//             new Text(
//               "Áo TeenWorld",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w400,
//                 color: Color(0xff716767),
//               ),
//             ),
//             new Expanded(child: Container()),
//             new Icon(
//               Icons.arrow_forward_ios,
//               color: Colors.black26,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

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
