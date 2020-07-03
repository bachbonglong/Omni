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
  stock{
    imports{
      items_detail{
        qty
      }
    }
  }
  product {
    products {
      name
      price
      sale_price
      _id
      variants {
        id
        weight
        price
        _id
      }
      weight
      desc
      in_price
      tags {
        name
      }
      featured_photo {
        url
      }
      
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

const String user = r'''
query{
  user{
    users{
      display_name,email,
    }
  }
}
''';