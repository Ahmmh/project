import 'package:flutter/material.dart';
import 'package:larak_app/screens/user_managment/user_managment.dart';
import 'package:larak_app/constants/size_config.dart';
import '../../../components/default_button.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        const SizedBox(
          height: 300,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: SizeConfig.screenWidth * 0.9,
          child: DefaultButton(
            text: "User managment",
            press: () {
              Navigator.pushNamed(context, UserManagment.routeName);
            },
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    ));
  }
}