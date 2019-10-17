class Product {
  final int id;
  final double price;
  final String description;
  final String image;

  Product({this.id, this.price, this.description, this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      price: json['price'],
      description: json['description'],
      image: json['image']
    );
  }
}