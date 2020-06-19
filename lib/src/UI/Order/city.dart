import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class City extends StatefulWidget {
  City({Key key}) : super(key: key);

  @override
  _City createState() => _City();
}

class _City extends State<City> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thành Phố"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/src/res/img/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: new ListView.builder(
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              return new GestureDetector(
                child: new ListTile(
                    title: new Card(
                  elevation: 5.0,
                  child: new Container(
                    alignment: Alignment.center,
                    margin: new EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: new Text("ListItem $index"),
                  ),
                )),
                onTap: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      child: new CupertinoAlertDialog(
                        title: new Column(
                          children: <Widget>[
                            new Text("Listview"),
                            new Icon(
                              Icons.favorite,
                              color: Colors.green,
                            )
                          ],
                        ),
                        content: new Text("Selected Item $index"),
                        actions: <Widget>[
                          new FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: new Text("OK"))
                        ],
                      ));
                },
              );
            }),
      ),
    );
  }
}
