import 'package:flutter/material.dart';
import 'package:larak_app/screens/dashboard/dashboard.dart';
import 'package:larak_app/screens/splash/splash_screen.dart';
import 'profile_menu.dart';
class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfileMenu(
            text: "Dashboard",
            icon: "assets/icons/Settings.svg",
            press: () {Navigator.pushNamed(context, Dashboard.routeName);},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {Navigator.pushNamed(context, SplashScreen.routeName);},
          ),
        ],
      ),
    );
  }
}
