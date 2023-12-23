import 'package:flutter/material.dart';
import 'package:larak_app/components/default_button.dart';
import 'package:larak_app/screens/sign_in/sign_in_screen.dart';
import 'package:larak_app/screens/sign_up/sign_up_screen.dart';
import 'package:larak_app/constants/size_config.dart';
class Account_type extends StatelessWidget {
  const Account_type({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        const SizedBox(height: 100,),
        const Text(
          'choose your account type',
          style: TextStyle(fontSize: 20, color: Colors.black87),
        ),
        const SizedBox(
          height: 200,
        ),
        SizedBox(
          width: SizeConfig.screenWidth * 0.9,
          child: DefaultButton(
            text: "Creat manager account",
            press: () {
              Navigator.pushNamed(context, SignUpScreen.routeName);
            },
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          width: SizeConfig.screenWidth * 0.9,
          child: DefaultButton(
            text: "Enter as a user",
            press: () {
              Navigator.pushNamed(context, SignInScreen.routeName);
            },
          ),
        ),
      ],
    ));
  }
}
