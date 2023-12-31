import 'package:flutter/material.dart';
import 'package:larak_app/screens/sign_in/sign_in_screen.dart';
import 'package:larak_app/constants/constant.dart';
import 'package:larak_app/constants/size_config.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignInScreen.routeName),
          child: Text(
            "Sign in",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: primaryColor),
          ),
        ),
      ],
    );
  }
}
