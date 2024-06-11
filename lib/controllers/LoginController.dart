import 'package:flutter/material.dart';

void signup(GlobalKey<FormState> formKey, BuildContext context, {required email,
required password}) {
  if (!formKey.currentState!.validate()) {
    return;
  }
  print("$email $password");
  Navigator.pushNamed(context, 'home');
}

String? validTextFormtype(value) {
  if (value!.isEmpty || value == null) {
    return "Campo obligatorio";
  }
  return null;
}