import 'package:duan_cntt2/src/API/query.dart';
import 'package:duan_cntt2/src/UI/Home/Home.dart';
import 'package:duan_cntt2/src/UI/Home/HomePage.dart';
import 'package:duan_cntt2/src/UI/Order/AddCustomer.dart';
import 'package:duan_cntt2/src/UI/Order/AddCustomerHad.dart';
import 'package:duan_cntt2/src/UI/Order/AddOrder.dart';
import 'package:duan_cntt2/src/UI/Order/AddProductHad.dart';
import 'package:duan_cntt2/src/UI/Order/AddProductOrder.dart';
import 'package:duan_cntt2/src/UI/Order/Customer.dart';
import 'package:duan_cntt2/src/UI/Order/Delivery.dart';
import 'package:duan_cntt2/src/UI/Order/Order.dart';
import 'package:duan_cntt2/src/UI/Order/Paymenthad.dart';
import 'package:duan_cntt2/src/UI/Order/city.dart';
import 'package:duan_cntt2/src/UI/Order/payment.dart';
import 'package:duan_cntt2/src/UI/Order/stateOrderHoanthanh.dart';
import 'package:duan_cntt2/src/UI/Order/stateorderDonggoi.dart';
import 'package:duan_cntt2/src/UI/Order/stateorderDuyet.dart';
import 'package:duan_cntt2/src/UI/Order/stateorderXuatkho.dart';
import 'package:duan_cntt2/src/UI/Order/statusorder.dart';
import 'package:duan_cntt2/src/UI/Product/AddProduct.dart';
import 'package:duan_cntt2/src/UI/Product/Product.dart';
import 'package:duan_cntt2/src/UI/Product/TypeProduct.dart';
import 'package:duan_cntt2/src/UI/WareHouse/WareHouse.dart';
import 'package:duan_cntt2/src/UI/WareHouse/addproductwarehouse.dart';
import 'package:duan_cntt2/src/UI/WareHouse/addproductwarehousehad.dart';
import 'package:duan_cntt2/src/UI/WareHouse/addsponsor.dart';
import 'package:duan_cntt2/src/UI/WareHouse/importproduct.dart';
import 'package:duan_cntt2/src/UI/WareHouse/paymentwarehouse.dart';
import 'package:duan_cntt2/src/UI/WareHouse/sponsor.dart';
import 'package:duan_cntt2/src/UI/WareHouse/statewarehouseDuyet.dart';
import 'package:duan_cntt2/src/UI/WareHouse/statewarehouseHoanThanh.dart';
import 'package:duan_cntt2/src/UI/WareHouse/statewarehouseNhapKho.dart';
import 'package:duan_cntt2/src/UI/login/login.dart';
import 'package:duan_cntt2/src/UI/slpashPage.dart/splashPage.dart';
import 'package:duan_cntt2/src/utils/widget/scanQR.dart';
import 'package:flutter/material.dart';
import 'package:duan_cntt2/src/constants/constants.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GraphQLConfig extends StatefulWidget{
  @override
  _GrahpQLConfigState createState() => _GrahpQLConfigState();
}

class _GrahpQLConfigState extends State<GraphQLConfig> {
  final storage = new FlutterSecureStorage();
  ValueNotifier<GraphQLClient> _valueNotifier;
  @override
  void initState() {
    // TODO: implement initState
    _initClient();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
return  GraphQLProvider(
  client: _valueNotifier,
  child:   MaterialApp(
    home: SplashPage(),
    debugShowCheckedModeBanner: false,
    onGenerateRoute: routes,
  ),
); }
  Route routes(RouteSettings settings) {
    switch (settings.name) {
      case Constants.splashScreen:
        return new MaterialPageRoute(
          builder: (context) {
            return SplashPage();
          },
        );
        break;
      case Constants.login:
        return new MaterialPageRoute(
          builder: (context) {
            return Login(/*_valueNotifier.value*/);
          },
        );
        break;
      case Constants.homepage:
        return new MaterialPageRoute(

          builder: (context) {
            return HomePage();
          },
        );
        break;
      case Constants.home:
        return new MaterialPageRoute(
          builder: (context) {
            return Home();
          },
        );
        break;
      case Constants.addproduct:
        return new MaterialPageRoute(
          builder: (context) {
            return AddProduct();
          },
        );
        break;
      case Constants.product:
        return new MaterialPageRoute(
          builder: (context) {
            return Product();
          },
        );
        break;
      case Constants.typeproduct:
        return new MaterialPageRoute(
          builder: (context) {
            return TypeProduct();
          },
        );
        break;
      case Constants.addproducthad:
        return new MaterialPageRoute(
          builder: (context) {
            return AddProductHad();
          },
        );
        break;
      case Constants.addorder:
        return new MaterialPageRoute(
          builder: (context) {
            return AddOrder();
          },
        );
        break;
      case Constants.addproductorder:
        return new MaterialPageRoute(
          builder: (context) {
            return AddProductOrder();
          },
        );
        break;
      case Constants.order:
        return new MaterialPageRoute(
          builder: (context) {
            return Order();
          },
        );
        break;
      case Constants.customer:
        return new MaterialPageRoute(
          builder: (context) {
            return Customer();
          },
        );
        break;
      case Constants.addcustomer:
        return new MaterialPageRoute(
          builder: (context) {
            return AddCustomer();
          },
        );
        break;
      case Constants.city:
        return new MaterialPageRoute(
          builder: (context) {
            return City();
          },
        );
        break;
      case Constants.addcustomerhad:
        return new MaterialPageRoute(
          builder: (context) {
            return AddCustomerHad();
          },
        );
        break;
      case Constants.payment:
        return new MaterialPageRoute(
          builder: (context) {
            return Payment();
          },
        );
        break;
      case Constants.paymenthad:
        return new MaterialPageRoute(
          builder: (context) {
            return PaymentHad();
          },
        );
        break;
      case Constants.statusorder:
        return new MaterialPageRoute(
          builder: (context) {
            return StatusOrder();
          },
        );
        break;

      case Constants.statusorderDuyet:
        return new MaterialPageRoute(
          builder: (context) {
            return StateOrderDuyet();
          },
        );
        break;

      case Constants.statusorderDonggoi:
        return new MaterialPageRoute(
          builder: (context) {
            return StateOrderDongGoi();
          },
        );
        break;

      case Constants.statusorderXuatkho:
        return new MaterialPageRoute(
          builder: (context) {
            return StateOrderXuatKho();
          },
        );
        break;

      case Constants.statusorderHoanthanh:
        return new MaterialPageRoute(
          builder: (context) {
            return StateOrderHoanThanh();
          },
        );
        break;

      case Constants.delivery:
        return new MaterialPageRoute(
          builder: (context) {
            return Delivery();
          },
        );
        break;
      case Constants.addwarehouse:
        return new MaterialPageRoute(
          builder: (context) {
            return WareHouse();
          },
        );
        break;
      case Constants.addsponsor:
        return new MaterialPageRoute(
          builder: (context) {
            return AddSponsor();
          },
        );
        break;
      case Constants.sponsor:
        return new MaterialPageRoute(
          builder: (context) {
            return Sponsor();
          },
        );
        break;
      case Constants.qrcamera:
        return new MaterialPageRoute(
          builder: (context) {
            return ScanQRPage();
          },
        );
        break;

      case Constants.importproduct:
        return new MaterialPageRoute(
          builder: (context) {
            return ImportProduct();
          },
        );
        break;

      case Constants.addproductwarehouse:
        return new MaterialPageRoute(
          builder: (context) {
            return AddProductWareHouse();
          },
        );
        break;
      case Constants.addproductwarehousehad:
        return new MaterialPageRoute(
          builder: (context) {
            return AddProductWareHouseHad();
          },
        );
        break;

      case Constants.statewarehouseDuyet:
        return new MaterialPageRoute(
          builder: (context) {
            return StateWareHouseDuyet();
          },
        );
        break;

      case Constants.statewarehouseNhapKho:
        return new MaterialPageRoute(
          builder: (context) {
            return StateWareHouseNhapKho();
          },
        );
        break;

      case Constants.paymentwarehouse:
        return new MaterialPageRoute(
          builder: (context) {
            return PaymentWareHouse();
          },
        );
        break;
      case Constants.statewarehouseHoanThanh:
        return new MaterialPageRoute(
          builder: (context) {
            return StateWareHouseHoanThanh();
          },
        );
        break;

      default:
        return null;
    }
  }

  void _initClient() {
    HttpLink link = HttpLink(uri: "https://api-dev.azsales.vn/graphql");
    AuthLink authLink = AuthLink(getToken: () async {
return storage.read(key: "jwt").then((value) => value);
    });
    link.concat(authLink);

     _valueNotifier= ValueNotifier(GraphQLClient(link: link,cache: InMemoryCache()));
  }
}
void main() => runApp(GraphQLConfig());

