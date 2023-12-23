import 'package:flutter/material.dart';
import 'package:larak_app/constants/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:larak_app/screens/favourit_product/favourit.dart';
import 'package:larak_app/screens/home/home.dart';
import 'package:larak_app/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:larak_app/models/cart/cart_provider.dart';

class CartPage extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (ctx, index) {
          var item = cartItems[index];
          return ListTile(
            leading: Image.network(item.image, width: 50, height: 50),
            title: Text(item.name),
            subtitle: Text('Quantity: ${item.quantity}'),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () => cartProvider.removeItem(item.id),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 2,
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
