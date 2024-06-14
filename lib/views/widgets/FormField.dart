import 'package:flutter/material.dart';

Padding createTextFormField(labetext) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
    child: Container(
      width: double.infinity,
      child: TextFormField(
        style: const TextStyle(
          fontFamily: 'Plus Jakarta Sans',
          color: Color(0xFF101213),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        autofocus: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Campo obligatorio';
          }
          return null;
        },
        keyboardType: assignTextInputType(labetext),
        autofillHints: assignAutoFillHints(labetext),
        decoration: InputDecoration(
          labelText: labetext,
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
      ),
    ),
  );
}

assignTextInputType(labeltext) {
  if (labeltext == 'Correo') {
    return TextInputType.emailAddress;
  } else if (labeltext == 'Contraseña' || labeltext == 'Confirmar Contraseña') {
    return TextInputType.visiblePassword;
  } else if (labeltext == 'Celular') {
    return TextInputType.phone;
  } else {
    return TextInputType.text;
  }
}

assignAutoFillHints(labeltext) {
  if (labeltext == 'Correo') {
    return [AutofillHints.email];
  }
  if (labeltext == 'Contraseña' || labeltext == 'Confirmar Contraseña') {
    return [AutofillHints.password];
  } else {
    return null;
  }
}

decorationTextFormField(String label) {
  return InputDecoration(
    labelText: label,
    labelStyle: labelStyle(),
    enabledBorder: enabledBorder(),
    focusedBorder: focusedBorder(),
    errorBorder: errorBorder(),
    focusedErrorBorder: focusedErrorBorder(),
    filled: true,
    fillColor: const Color(0xFFF1F4F8),
    hintText: assingHintText(label),
  );
}

assingHintText(String label) {
  if (label == 'Correo') {
    return "Ingrese su correo";
  } else if (label == 'Contraseña') {
    return "Ingrese su contraseña";
  }
}

textStyle() {
  return const TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    color: Color(0xFF101213),
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}

assignTextStyleButton() {
  return const TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 16,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w600,
  );
}

focusedErrorBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color(0xFFF1F4F8),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(12),
  );
}

errorBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color(0xFFE0E3E7),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(12),
  );
}

focusedBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color(0xFF4B39EF),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(12),
  );
}

enabledBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color(0xFFF1F4F8),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(12),
  );
}

labelStyle() {
  return const TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    color: Color(0xFF57636C),
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}
