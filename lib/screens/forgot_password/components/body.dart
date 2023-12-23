import 'package:flutter/material.dart';
import 'package:larak_app/components/custom_surfix_icon.dart';
import 'package:larak_app/components/default_button.dart';
import 'package:larak_app/components/form_error.dart';
import 'package:larak_app/components/have_account.dart';
import 'package:larak_app/constants/constant.dart';
import 'package:larak_app/constants/size_config.dart';
class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Please enter your number and we will send \nyou a link to return to your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              const ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({super.key});

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String? email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kNumberNullError)) {
                setState(() {
                  errors.remove(kNumberNullError);
                });
              } else if (numberValidatorRegExp.hasMatch(value) &&
                  errors.contains(kInvalidNumberError)) {
                setState(() {
                  errors.remove(kInvalidNumberError);
                });
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty && !errors.contains(kNumberNullError)) {
                setState(() {
                  errors.add(kNumberNullError);
                });
              } else if (!numberExaption.hasMatch(value) &&
                  !errors.contains(kInvalidNumberError)) {
                setState(() {
                  errors.add(kInvalidNumberError);
                });
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "number",
              hintText: "Enter your number",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/phone.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                // Do what you want to do
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          const HaveAccount(),
        ],
      ),
    );
  }
}
