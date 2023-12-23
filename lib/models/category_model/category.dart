import 'dart:convert';
import 'package:larak_app/models/produt_model/product.dart';

CategoryModel categoryFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    // required this.id,
    required this.name,
    required this.products,
  });

  // String id;
  String name;
  List<ProductModel> products;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        // id: json["id"],
        name: json["name"],
        products: List<ProductModel>.from(json["products"].map((x) => ProductModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "name": name,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}
