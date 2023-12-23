import 'dart:convert'; 

ProductModel productFromJson(String str) => ProductModel.fromJson(json.decode(str));
String productToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.image,
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.status,
    required this.favourite,
    this.quantity = 1, // Default value set to 1
  });

  String image;
  String id;
  String name;
  String price;
  String description;
  String status;
  bool favourite;
  int quantity; // Quantity field added

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        price: json['price'],
        description: json['description'],
        status: json['status'],
        favourite: json['favourite'] is bool 
           ? json['favourite'] 
           : json['favourite'].toString().toLowerCase() == 'true',
        quantity: json['quantity'] ?? 1, // Added quantity handling
  );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'price': price,
        'description': description,
        'status': status,
        'favourite': favourite,
        'quantity': quantity, // Included in JSON serialization
  };

  // Add copyWith method
  ProductModel copyWith({
    String? id,
    String? name,
    String? image,
    String? price,
    String? description,
    String? status,
    bool? favourite,
    int? quantity,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      description: description ?? this.description,
      status: status ?? this.status,
      favourite: favourite ?? this.favourite,
      quantity: quantity ?? this.quantity,
    );
  }
}
