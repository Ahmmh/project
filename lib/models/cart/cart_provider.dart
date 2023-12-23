import 'package:flutter/foundation.dart';
import 'package:larak_app/models/produt_model/product.dart';

class CartProvider with ChangeNotifier {
  Map<String, ProductModel> _cartItems = {};

  Map<String, ProductModel> get cartItems => {..._cartItems};

  void addItem(ProductModel product) {
    if (_cartItems.containsKey(product.id)) {
      // The item already exists, so we just need to increase the quantity
      _cartItems.update(
        product.id,
        (existingItem) => ProductModel(
          id: existingItem.id,
          name: existingItem.name,
          image: existingItem.image,
          price: existingItem.price,
          description: existingItem.description,
          status: existingItem.status,
          favourite: existingItem.favourite,
          quantity: existingItem.quantity + 1,  // Increase quantity
        ),
      );
    } else {
      // The item is new to the cart, add it with a quantity of 1
      _cartItems.putIfAbsent(
        product.id,
        () => ProductModel(
          id: product.id,
          name: product.name,
          image: product.image,
          price: product.price,
          description: product.description,
          status: product.status,
          favourite: product.favourite,
          quantity: 1,  // Initial quantity is 1
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void updateQuantity(String productId, int newQuantity) {
    if (!_cartItems.containsKey(productId) || newQuantity < 1) return;
    _cartItems.update(
      productId,
      (existingItem) => ProductModel(
        id: existingItem.id,
        name: existingItem.name,
        image: existingItem.image,
        price: existingItem.price,
        description: existingItem.description,
        status: existingItem.status,
        favourite: existingItem.favourite,
        quantity: newQuantity,  // Update quantity
      ),
    );
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
