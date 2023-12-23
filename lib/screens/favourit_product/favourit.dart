import 'package:flutter/material.dart';
import 'package:larak_app/constants/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:larak_app/screens/cart/cart_page.dart';
import 'package:larak_app/screens/home/home.dart';
import 'package:larak_app/screens/product_details/product_details.dart'; // Ensure you import the ProductDetails
import 'package:larak_app/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:larak_app/models/favourit_provider/favourit_provider.dart';

class FavoritesPage extends StatelessWidget {
  static String routeName = "/favourit_product";

  @override
  Widget build(BuildContext context) {
    final favoriteItems = Provider.of<FavoriteProvider>(context).favoriteItems;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites', style: TextStyle(fontSize: 20)),
      ),
      body: ListView.builder(
        itemCount: favoriteItems.length,
        itemBuilder: (ctx, index) {
          final product = favoriteItems[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ProductDetails.routeName,
                  arguments: product,
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  leading: Image.network(product.image, width: 70, height: 70, fit: BoxFit.cover),
                  title: Text(product.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  subtitle: Text('\$${product.price}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.green)),
                  trailing: IconButton(
                    icon: Icon(Icons.favorite, color: Colors.red),
                    onPressed: () {
                      Provider.of<FavoriteProvider>(context, listen: false).removeFavorite(product);
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 1,
        onItemTapped: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, Home.routeName);
              break;
            case 1:
              Navigator.pushNamed(context, FavoritesPage.routeName);
              break;
            case 2:
              Navigator.pushNamed(context, CartPage.routeName);
              break;
            case 3:
              Navigator.pushNamed(context, ProfileScreen.routeName);
              break;
          }
        },
      ),
    );
  }
}
