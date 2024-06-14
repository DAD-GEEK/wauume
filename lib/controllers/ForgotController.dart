import 'package:flutter/material.dart';
import 'package:wauume/controllers/login/firebase_service.dart';
import 'package:wauume/views/pages/loginPages/ForgotPassword.dart';
import 'package:wauume/views/pages/loginPages/Login.dart';
import 'package:wauume/views/pages/userPages/Home.dart';
import 'package:wauume/views/pages/signupPages/SignUp.dart';

void forgotpassword (GlobalKey<FormState> formKey, BuildContext context,
    {required String email}){
  final formState = formKey.currentState;
  if (formState != null && formState.validate()) {
    resetPassword(email);
    loadNewPage(context, 'Login');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Correo enviado con éxito'),
      duration: Duration(seconds: 1)));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Datos no invalidos'),
      duration: Duration(seconds: 1)),
    );
  }
}

String? validEmailFormtype(value) {
  if (value!.isEmpty || value == null) {
    return "Campo obligatorio";
  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
    return 'Por favor ingrese un email válido';
  }
  return null;
}

loadNewPage(BuildContext context, String page) {
  final pageRoutes = {
    'Login': () => const Login(),
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