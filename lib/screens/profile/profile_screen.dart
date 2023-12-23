import 'package:flutter/material.dart';
import 'package:larak_app/constants/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:larak_app/screens/cart/cart_page.dart';
import 'package:larak_app/screens/favourit_product/favourit.dart';
import 'package:larak_app/screens/home/home.dart';
import 'package:larak_app/screens/profile/components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile",style: TextStyle(fontSize: 20)),
      ),
      body: const Body(),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 3,
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
