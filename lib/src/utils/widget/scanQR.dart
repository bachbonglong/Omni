import 'package:flutter/material.dart';
import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:duan_cntt2/src/constants/constants.dart';
import 'package:hexcolor/hexcolor.dart';

void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');

class ScanQRPage extends StatefulWidget {
  @override
  _ScanQRPageState createState() => new _ScanQRPageState();
}

class _ScanQRPageState extends State<ScanQRPage>
    with SingleTickerProviderStateMixin {
  QRReaderController controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<CameraDescription> cameras;

  bool _isOnFlash = false;
  bool _backCamera = true;

  void _initCamera() async {
    // await PermissionHandler().requestPermissions([Permission.camera]);
    await Permission.camera.request();
    cameras = await availableCameras();
    onNewCameraSelected(0);
  }

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Animation<double> verticalPosition;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        key: _scaffoldKey,
         appBar: AppBar(
          backgroundColor: Hexcolor("#FBFCF6"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, Constants.homepage);
            },
          ),
          title: Container(
            child: Text(
              'Quét Mã QR',
              style: TextStyle(
                  fontFamily: ('Jura'),
                  fontSize: 27,
                  color: (const Color(0xff413b3b)),
                  fontWeight: FontWeight.w300),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(_isOnFlash ? Icons.flash_on : Icons.flash_off),
              color: Colors.white,
              onPressed: toggleFlash,
            ),
            IconButton(
              icon: Icon(_backCamera ? Icons.camera_rear : Icons.camera_front),
              color: Colors.white,
              onPressed: toggleCam,
            ),
          ],
        ),
        body: Container(
          child: Stack(
            children: <Widget>[
              new Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: _cameraPreviewWidget(),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      width: MediaQuery.of(context).size.width / 1.8,
                      child: new Image.asset("lib/src/res/img/scanqr.png"))),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
    } else {
      return new AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: new QRReaderPreview(controller),
      );
    }
    return null;
  }

  void onCodeRead(dynamic value) {
    showInSnackBar(value.toString());
  }

  void onNewCameraSelected(int cameraIndex) async {
    if (controller != null) {
      await controller.dispose();
    }
    controller = new QRReaderController(cameras[cameraIndex],
        ResolutionPreset.high, [CodeFormat.qr, CodeFormat.pdf417], onCodeRead);

    controller.addListener(() {
      if (mounted) setState(() {});
      if (controller.value.hasError) {
        showInSnackBar('Camera error ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
    } on QRReaderException catch (e) {
      logError(e.code, e.description);
      showInSnackBar('Error: ${e.code}\n${e.description}');
    }

    if (mounted) {
      setState(() {});
      controller.startScanning();
    }
  }

  void showInSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
        backgroundColor: Colors.red,
        duration: Duration(hours: 1),
        action: SnackBarAction(
            label: "Access",
            onPressed: () async {
              if (await canLaunch(message)) {
                await launch(message);
                controller.dispose();
              }
            }),
        content: new Container(
          child: new Text(message),
        )));
  }

  toggleFlash() {
    if (!_backCamera) return;

    setState(() {
      _isOnFlash = !_isOnFlash;
      controller.toggleFlash().then((onValue) {});
      controller.startScanning();
    });
  }

  toggleCam() {
    setState(() {
      _backCamera = !_backCamera;
      if (cameras.length >= 2) {
        if (!_backCamera) {
          _isOnFlash = false;
        }
        onNewCameraSelected(_backCamera ? 0 : 1);
      }
    });
  }
}
