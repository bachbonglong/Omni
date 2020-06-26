const String getToken = r'''
  query getToken($username : String!,$password :String!){
    auth{
      login(username:$username,password:$password){
        accessToken
      }
    }
  }
  ''';

  const String products = r"""
query {
  product {
    products {
      name
    }
  }
}

                  """;