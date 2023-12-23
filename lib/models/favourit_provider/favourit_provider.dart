import 'package:flutter/foundation.dart';
import 'package:larak_app/models/produt_model/product.dart';

class FavoriteProvider with ChangeNotifier {
  List<ProductModel> _favoriteItems = [];

  List<ProductModel> get favoriteItems => _favoriteItems;

  void addFavorite(ProductModel product) {
    _favoriteItems.add(product);
    notifyListeners();
  }

  void removeFavorite(ProductModel product) {
    _favoriteItems.remove(product);
    notifyListeners();
  }

  bool isFavorite(ProductModel product) {
    return _favoriteItems.contains(product);
  }
}
