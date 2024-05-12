import 'package:first/preference/pref_utils.dart';
import 'package:first/routes/app_route.dart';
import 'package:first/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/custom_suffix_icon.dart';

class SignInForm extends StatefulWidget {

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  readRecord() async {

    final SharedPreferences pref = await SharedPreferences.getInstance();
    String email = pref.getString('email') ?? "";

    setState(() {
      '''
      email : $email
      ''';
    });
  }

  saverecord(String email, String password) async {
    try{
      final SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString('email', email);
      await pref.setString('password', password);

      print("data saved succesfully");
    }
    catch(e){
      print(e.toString());
    }
  }


  String? _emailError, _passwordError;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildEmailFormField(),
          SizedBox(
            height: 24,
          ),
          buildPasswordFormField(),
          SizedBox(
            height: 24,
          ),
          buildForgotPasswordWidget(context),
          SizedBox(
            height: 24,
          ),
          buildLoginButtonWidget()
        ],
      ),
    );
  }

  buildEmailFormField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email address',
        labelText: 'Email',
        errorText: _emailError,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: CustomSuffixIcon('assets/icons/Mail.svg'),
      ),
    );
  }

  buildPasswordFormField() {
    return TextFormField(
      controller: _passwordController,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: 'Enter password',
        errorText: _passwordError,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: CustomSuffixIcon('assets/icons/Lock.svg'),
      ),
    );
  }

  buildForgotPasswordWidget(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {},
        child: Text(
          "Forgot Password",
          style: TextStyle(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  buildLoginButtonWidget() {
    return MaterialButton(
      color: Colors.green,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28)
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      onPressed: () {
        // get all values from form field
        String email = _emailController.text.toString().trim();
        String password = _passwordController.text.toString().trim();

        saverecord(email, password);

        resetFocus();

        if (!Utils.isValidEmail(email)) {
          // show error on email field
          setState(() {
            _emailError = 'Enter valid email address';
          });
        } else if (!Utils.isValidPassword(password)) {
          // show error on password field
          setState(() {
            _passwordError = 'Enter valid password';
          });
        } else {
          // navigate to home screen
          // store this data to database or server
          PrefUtils.updateLoginStatus(true).then((value) {
            if (value) {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoute.homeScreen, (route) => false);
            }
          });
        }
      },
      child: Text(
        'Sign In',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  void resetFocus() {
    setState(() {
      _emailError = null;
      _passwordError = null;
    });
  }
}

