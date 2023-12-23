import 'package:flutter/material.dart';
import 'package:larak_app/constants/size_config.dart';
import 'package:larak_app/screens/account_type/components/body.dart';

class Type extends StatelessWidget {
  static String routeName = "/type";

  const Type({super.key});
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Account type' , style: TextStyle(fontSize: 20),),),
      body: const Account_type()
    );
  }
}
