import 'package:flutter/material.dart';
import 'package:wauume/views/pages/loginPages/ForgotPassword.dart';
import 'package:wauume/views/pages/userPages/Home.dart';
import 'package:wauume/views/pages/signupPages/SignUp.dart';
import 'package:wauume/views/pages/signupPages/SignUpTwo.dart';

void signup(GlobalKey<FormState> formKey, BuildContext context,
    {required String email, required String password}) {
  final formState = formKey.currentState;
  if (formState != null && formState.validate()) {
    loadNewPage(formKey, context, 'Home');
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Datos no invalidos'),
      duration: Duration(seconds: 1)),
    );
  }
}

String? validPasswordFormType(value) {
  if (value == null || value.isEmpty) {
    return 'Por favor ingrese una contraseña';
  } else if (value.length < 6) {
    return 'La contraseña debe tener al menos 6 caracteres';
  }
  return null;
}

String? validEmailFormtype(value) {
  if (value!.isEmpty || value == null) {
    return "Campo obligatorio";
  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
    return 'Por favor ingrese un email válido';
  }
  return null;
}

loadNewPage(GlobalKey<FormState> formKey, BuildContext context, String page) {
  final pageRoutes = {
    'SignUp': () => const SignUp(),
    'Home': () => const Home(),
    'ForgotPassword': () => const ForgotPassword(),
    'SignUpTwo': () => const SignUpTwo(),
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
