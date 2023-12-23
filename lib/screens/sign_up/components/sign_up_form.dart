import 'package:flutter/material.dart';
import 'package:larak_app/components/custom_surfix_icon.dart';
import 'package:larak_app/components/default_button.dart';
import 'package:larak_app/components/form_error.dart';
import 'package:larak_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:larak_app/constants/constant.dart';
import 'package:larak_app/constants/size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? number;
  String? password;
  bool showPassword = true;
  bool confirmpassword = true;
  // ignore: non_constant_identifier_names
  String? conform_password;
  bool remember = false;
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
    print("Removed error: $error");
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
          buildConformPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: showPassword,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
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
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
          child: const CustomSurffixIcon(svgIcon: "assets/icons/showpassword.svg"),
        ),
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: confirmpassword,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: kMatchPassError);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              confirmpassword = !confirmpassword;
            });
          },
          child: const CustomSurffixIcon(svgIcon: "assets/icons/showpassword.svg"),
        ),
      ),
    );
  }

  TextFormField buildNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => number = newValue,
      onChanged: (value) {
       if (value.isNotEmpty) {
        removeError(error: kNumberNullError);
      } else if (numberExaption.hasMatch(value)) {
        removeError(error: kInvalidNumberError);
      } else if (value.length == 11 && value.startsWith('07')) {
        removeError(error: kInvalidNumberError);
      } else if (value.length == 11) {
        removeError(error: kInvalidNumberError);
      } else if (!value.startsWith('07')) {
        removeError(error: kInvalidNumberError);
      }
        number =value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kInvalidNumberError);
          return "";
        } else if (value.length != 11) {
          addError(error: kInvalidNumberError);
          return "";
        } else if (!value.startsWith('07')) { 
          addError(error: kInvalidNumberError);
          return "";
      }
      return null;},
      decoration: const InputDecoration(
        labelText: "number",
        hintText: "Enter your number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/phone.svg"),
      ),
    );
  }
}
