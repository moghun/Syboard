class Product {
  String imgURL;
  String productName;
  String seller;
  double rating;
  double price;

  Product(
      {required this.imgURL,
        required this.productName,
        required this.rating,
        required this.price,
        this.seller = "Anonymous"});
}
