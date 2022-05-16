class CartModel {
  int? id;
  String? title;
  double? price;
  String? category;
  String? image;
  int? quantity;
  bool? isExit;

  CartModel(
      {this.id,
      this.title,
      this.price,
      this.category,
      this.image,
      this.isExit,
      this.quantity});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    category = json['category'];
    image = json['image'];
    isExit = json["isExit"];
    quantity = json["quantity"];
  }
}
