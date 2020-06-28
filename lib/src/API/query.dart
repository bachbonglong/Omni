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
      name  price sale_price 
      featured_photo
      {url}
    }
  }
}


                  """;
const String order = r'''query{
  order{
    orders {
      customer_name ,phone_number, amount,discount,bank_payment,id,
      status,date_created 
      created_by_user  {
        display_name 
      }
    }
  }
}
''';
