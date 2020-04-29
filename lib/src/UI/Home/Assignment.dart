import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Assignment extends StatefulWidget {
  Assignment({Key key}) : super(key: key);

  @override
  _Assignment createState() => _Assignment();
}

class _Assignment extends State<Assignment> with SingleTickerProviderStateMixin {
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
            title: Row(
              children: <Widget>[
                Text('Easy to Control',
                    style: TextStyle(
                      fontFamily: ('SimSun-ExtB'),
                      fontSize: 13,
                      color: (const Color(0xff344755)),
                      shadows: [
                        Shadow(
                          color: const Color(0xff000000).withOpacity(0.16),
                          offset: Offset(0, 3),
                          blurRadius: 0.0,
                        ),
                      ],
                    )),
                Text(' Omni ',
                    style: TextStyle(
                      fontFamily: ('VNI-Briquet'),
                      fontSize: ((27)),
                      color: (const Color(0xff344755)),
                      shadows: [
                        Shadow(
                          color: const Color(0xff000000).withOpacity(0.16),
                          offset: Offset(0, 3),
                          blurRadius: 0.0,
                        ),
                      ],
                    )),
                Text(' Easy to Succeed',
                    style: TextStyle(
                      fontFamily: ('SimSun-ExtB'),
                      fontSize: (13),
                      color: (const Color(0xff344755)),
                      shadows: [
                        Shadow(
                          color: const Color(0xff000000).withOpacity(0.16),
                          offset: Offset(0, 3),
                          blurRadius: 0.0,
                        ),
                      ],
                    ))
              ],
            )),
        body: Container(
            color: Hexcolor('#FBFCF6'),
            child: RefreshIndicator(
                onRefresh: () async {
                  await new Future.delayed(const Duration(seconds: 2));
                },
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        child: Text(
                          'Đơn Hàng',
                          style: TextStyle(
                            fontFamily: ('Jura'),
                            fontSize: 27,
                            color: (const Color(0xff413b3b)),
                            shadows: [
                              Shadow(
                                color:
                                    const Color(0xff000000).withOpacity(0.16),
                                offset: Offset(0, 3),
                                blurRadius: 0.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      //Code in Here 
                    ],
                  ),
                ))));
  }
}
