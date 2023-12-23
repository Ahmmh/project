import 'package:flutter/material.dart';
import 'package:larak_app/components/have_account.dart';
import 'package:larak_app/constants/constant.dart';
import 'package:larak_app/constants/size_config.dart';
import 'components/sign_up_form.dart';
class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up",style: TextStyle(fontSize: 20)),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Text("Register Account", style: headingStyle),
                  const Text(
                    "Complete your details or continue",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  const SignUpForm(),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Text(
                    'By continuing your confirm that you agree \nwith our Term and Condition',
                    textAlign: TextAlign.center,
                    // ignore: deprecated_member_use
                    style: Theme.of(context).textTheme.caption,
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  const HaveAccount()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
