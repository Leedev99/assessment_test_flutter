class ProductModels {
  List<ProductModel> productModels;
  bool error;
  String errorMsg;

  ProductModels({
    this.productModels,
    this.error,
    this.errorMsg,
  });

  factory ProductModels.fromJson(Map<String, dynamic> json) => new ProductModels(
        productModels: new List<ProductModel>.from(
        json["productModels"].map((x) => ProductModel.fromJson(x))),
        error: json["error"],
        errorMsg: json["error_msg"],
      );
}

class ProductModel {
 String id;
  String name;
  String image;
  String price;
  ProductModel({
    this.id,
    this.name,
    this.image,
    this.price,

  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => new ProductModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],

      );
}
