import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:duan_cntt2/src/UI/Home/HomePage.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

class SetTokenHeader extends StatelessWidget {
   final String jwt;
   SetTokenHeader(this.jwt, {Key key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink =
        HttpLink(uri: 'https://api-dev.azsales.vn/graphql'); //Test
    final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer' + jwt,
    // OR
    // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );

  final Link linkToken = authLink.concat(httpLink);
    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(  
        link: linkToken,
        cache: InMemoryCache(),
      ),
    );
    return GraphQLProvider(
      client: client,
      child: HomePage(),
    );
  }
}