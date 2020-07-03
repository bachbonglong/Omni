// ở đâu ra kiểu code này v ta?
// trời ạ
///
///phải làm model cho nó chứ
///thằng graphql thì nó là db hay api gì đó
///nhưng vào code mình thì phải chuyển nó thành model
///đương nhiên rồi
///

const String addProduct = r'''
mutation addProduct(
  $name: String!
  $price: Float!
  $in_price: Float!
  $sale_price: Float!
  $desc : String!
  $weight : Float!
  $tags : [String]
)

{
  product {
    createProduct(
      record: {
        name: $name
        price: $price
        in_price: $in_price
        sale_price: $sale_price
        weight: $weight
        cat_ids: [null]
        desc: $desc
        photo_urls : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYAsfhxzgTWkKV6t3qCAjaDfpxRIqluT7hGj_KNmKkeJaD9AQ&s"
        tag_names: $tags
      }
    )
    {
      recordId 
    }
  }
}
  ''';

const String updatProduct = r'''
mutation addProduct(
  $name: String!
  $price: Float!
  $in_price: Float!
  $sale_price: Float!
  $desc : String!
  $id : String!
  $weight : Float!
)

{
  product {
    updateProduct(
      filter:{
        _id : $id
      }
      record: {
        name: $name
        price: $price
        in_price: $in_price
        sale_price: $sale_price
        weight: 1
        cat_ids: [null]
        desc: $descs
        photo_urls:"https://images.squarespace-cdn.com/content/v1/5dd46eab3b375641d996b0a2/1576019973064-GZQOPJZ3UVBQV92VO8YJ/ke17ZwdGBToddI8pDm48kFEBgILyiTnhZABRKgnV-2Z7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QHyNOqBUUEtDDsRWrJLTmyh-8_5GJNvrfz4o4yOfLS66u_lcf2VTjKMMk01TMZP-2zgulA6mT1Z85jxTh44oq/Independent_Trading_Co._IND5000P_Grey_Heather_Front_High.jpg"
      }
    )
    {
      recordId 
    }
  }
}
''';

const String signupaccount = r'''
mutation  signupac(
  $username: String!
  $display_name: String!
  $email: String!
  $password: String!
){
  
  auth {
    register(
      record:{
      username: $username,
      display_name: $display_name,
      email: $email,
      password: $password
    }){
      _id
    }
  }
}
''';

