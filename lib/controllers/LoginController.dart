import 'package:flutter/material.dart';
import 'package:wauume/views/pages/loginPages/ForgotPassword.dart';
import 'package:wauume/views/pages/userPages/Home.dart';
import 'package:wauume/views/pages/signupPages/SignUp.dart';
import 'package:wauume/views/pages/signupPages/SignUpTwo.dart';

void validate(GlobalKey<FormState> formKey, BuildContext context,String page, {required email,
required password}) {
  if (formKey.currentState?.validate()??false) {
  loadNewPage(formKey, context, page);
  }else{
      ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Los campos son  obligatorios'),
      duration: Duration(seconds: 2),
    ),
  );
  }
   
}

String? validTextFormtype(value) {
  if (value!.isEmpty || value == null) {
    return "Campo obligatorio";
  }
  return null;
}


loadNewPage(GlobalKey<FormState> formKey,BuildContext context, String page) {

  final pageRoutes = {
    'SignUp': () => const SignUp(),
    'Home': () => const Home(),
    'ForgotPassword': () => const ForgotPassword(),
    'SignUpTwo' : () => const SignUpTwo(),
  };

  if (pageRoutes.containsKey(page)) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => pageRoutes[page]!(),
      ),
    );
  } else {
    throw Exception('Invalid page: $page');
  }
}