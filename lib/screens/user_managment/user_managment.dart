import 'package:flutter/material.dart';
import 'package:larak_app/screens/user_managment/components/body.dart';

class UserManagment extends StatelessWidget {
  static String routeName = "/user_mangment";

  const UserManagment({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:UserManagementScreen(),
    );
  }
}
