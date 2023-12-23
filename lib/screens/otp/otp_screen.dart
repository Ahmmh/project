import 'package:flutter/material.dart';
import 'package:larak_app/constants/size_config.dart';
import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";
  const OtpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification",style: TextStyle(fontSize: 20)),
      ),
      body: const Body(),
    );
  }
}
