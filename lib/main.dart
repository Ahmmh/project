import 'package:flutter/material.dart';
import 'package:larak_app/models/cart/cart_provider.dart';
import 'package:larak_app/models/favourit_provider/favourit_provider.dart';
import 'package:larak_app/screens/splash/splash_screen.dart';
import 'package:larak_app/routes.dart';
import 'package:larak_app/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Larak App',
        theme: AppTheme.lightTheme(context),
        initialRoute: SplashScreen.routeName,
        routes: routes,   
      ),
    );
  }
}
