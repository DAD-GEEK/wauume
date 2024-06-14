import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wauume/controllers/login/firebase_service.dart';
import 'package:wauume/controllers/usuarios/UserProvider.dart';
import 'package:wauume/models/userModel.dart';
import 'package:wauume/views/pages/userPages/Home.dart';
import 'package:wauume/views/pages/signupPages/SignUp.dart';

class SignUpController {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final String collection = 'Users';

  Future<void> createUser(GlobalKey<FormState> key,
      {required String name,
      required String lastname,
      required String email,
      required String password,
      required String phone,
      required Userprovider provider,
      required BuildContext context}) async {
    // Create user
    try {
      if (key.currentState!.validate()) {
        key.currentState!.save();
        UserModel user = UserModel(
            name: name,
            lastname: lastname,
            email: email,
            password: password,
            phone: phone);

        UserCredential userCredential = await createAccountWithEmailAndPassword(
            emailAddress: email, password: password);
        if (userCredential.user != null) {
          provider.addUser(user);
          await db.collection(collection).add(user.toMap());
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Usuario creado correctamente'),
            duration: Duration(seconds: 1)));
        // ignore: use_build_context_synchronously
        loadNewPage(context, 'Home');
        }
        
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Datos no validos'), duration: Duration(seconds: 1)));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Error al crear Usuario'),
          duration: Duration(seconds: 1)));
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

  String? validPasswordFormType(String password, String confirmPassword) {
    if (password.isEmpty) {
      return 'Por favor ingrese una contraseña';
    } else if (password.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    } else if (password != confirmPassword) {
      return 'Las contraseñas no coinciden';
    }
    return null;
  }

  String? validconfirmPasswordFormType(
      String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return 'Por favor ingrese una contraseña';
    } else if (confirmPassword.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    } else if (confirmPassword != password) {
      return 'Las contraseñas no coinciden';
    }
    return null;
  }

  String? validNameFormType(value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese su nombre';
    }
    return null;
  }

  String? validLastNameFormType(value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese su apellido';
    }
    return null;
  }

  String? validPhoneFormType(value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese su número de teléfono';
    } else if (value.length < 10) {
      return 'Por favor ingrese un número de teléfono válido';
    }
    return null;
  }

  void loadNewPage(BuildContext context, String page) {
    final pageRoutes = {
      'SignUp': () => const SignUp(),
      'Home': () => const Home(),
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
}
