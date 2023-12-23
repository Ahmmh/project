import 'package:flutter/widgets.dart';
import 'package:larak_app/screens/cart/cart_page.dart';
import 'package:larak_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:larak_app/screens/dashboard/dashboard.dart';
import 'package:larak_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:larak_app/screens/home/home.dart';
import 'package:larak_app/screens/login_success/login_success_screen.dart';
import 'package:larak_app/screens/otp/otp_screen.dart';
import 'package:larak_app/screens/product_details/product_details.dart';
import 'package:larak_app/screens/profile/profile_screen.dart';
import 'package:larak_app/screens/sign_in/sign_in_screen.dart';
import 'package:larak_app/screens/splash/splash_screen.dart';
import 'package:larak_app/screens/user_managment/user_managment.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'package:larak_app/screens/account_type/account_type.dart';
import 'package:larak_app/screens/favourit_product/favourit.dart';
 // We use name route
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  Type.routeName: (context) => const Type(),
  Home.routeName: (context) =>  Home(),
  ProductDetails.routeName: (context) =>  ProductDetails(),
  FavoritesPage.routeName: (context) =>  FavoritesPage(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  Dashboard.routeName: (context) => Dashboard(),
  UserManagment.routeName:(context)=> UserManagment(),
  CartPage.routeName:(context)=> CartPage()
};
