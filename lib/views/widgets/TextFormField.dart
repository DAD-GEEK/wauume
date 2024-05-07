import 'package:flutter/material.dart';

TextFormField createTextFormField(labeltext) {
    return TextFormField(
      style: const TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        color: Color(0xFF101213),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      autofocus: true,
      keyboardType: assignTextInputType(labeltext),
      autofillHints: assignAutoFillHints(labeltext),
      decoration: InputDecoration(
        labelText: labeltext,
        labelStyle: const TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            color: Color(0xFF57636C),
            fontSize: 16,
            fontWeight: FontWeight.w500),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFF1F4F8),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF4B39EF),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE0E3E7),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFF1F4F8),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: const Color(0xFFF1F4F8),
      ),
    );
  }

  assignTextInputType(labeltext) {
    if (labeltext == 'Correo') {
      return TextInputType.emailAddress;
    }
    if (labeltext == 'Contraseña') {
      return TextInputType.visiblePassword;
    } else {
      return TextInputType.text;
    }
  }

  assignAutoFillHints(labeltext) {
    if (labeltext == 'Correo') {
      return [AutofillHints.email];
    }
    if (labeltext == 'Contraseña') {
      return [AutofillHints.password];
    } else {
      return null;
    }
  }