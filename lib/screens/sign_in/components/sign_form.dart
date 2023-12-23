import 'package:flutter/material.dart';
import 'package:larak_app/components/custom_surfix_icon.dart';
import 'package:larak_app/components/form_error.dart';
import 'package:larak_app/helper/keyboard.dart';
import 'package:larak_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:larak_app/screens/login_success/login_success_screen.dart';

import '../../../components/default_button.dart';
import 'package:larak_app/constants/constant.dart';
import 'package:larak_app/constants/size_config.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? number;
  String? password;
  bool? remember = false;
  bool showpassword = true;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: primaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              const Text("Remember me"),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(

      obscureText:showpassword,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration:  InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              showpassword = !showpassword;
            });
          },
          child: const CustomSurffixIcon(svgIcon: "assets/icons/showpassword.svg"),
        ),
      ),
    );
  }

  TextFormField buildNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => number = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNumberNullError);
        } else if (numberExaption.hasMatch(value)) {
          removeError(error: kInvalidNumberError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNumberNullError);
          return "";
        } else if (value.length != 11 ) {
          addError(error: kInvalidNumberError);
          return "";
        }else if (!value.startsWith('07')) { 
          addError(error: kInvalidNumberError);
          return "";
      }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "number",
        hintText: "Enter your number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSurffixIcon(svgIcon: "assets/icons/phone.svg"),
        ),
      );
  }
}
