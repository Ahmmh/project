import 'package:flutter/material.dart';
import 'package:larak_app/constants/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:larak_app/screens/cart/cart_page.dart';
import 'package:larak_app/screens/favourit_product/favourit.dart';
import 'package:larak_app/screens/home/best_product.dart';
import 'package:larak_app/screens/home/category_list.dart';
import 'package:larak_app/screens/profile/profile_screen.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'search'),
                    )
                  ],
                ),
              ), //search field
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Text(
                  'Categories',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const CategoryList(), //category row list
              const Padding(
                  padding: EdgeInsets.only(top: 12, left: 12),
                  child: Text(
                    'Best product',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )),
              GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: bestproduct.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 1,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return BestProduct(
                        bestproduct:
                            bestproduct[index]); //the items of best product
                  }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0,
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
