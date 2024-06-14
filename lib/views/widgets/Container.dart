import 'package:flutter/material.dart';

containerBoxDecoration() {
  return BoxDecoration(
    boxShadow: const [
      BoxShadow(
        blurRadius: 4,
        color: Color(0x33000000),
      )
    ],
    gradient: const LinearGradient(
      colors: [Color(0xccffffff), Color.fromARGB(168, 233, 80, 34)],
    ),
    borderRadius: BorderRadius.circular(12),
  );
}
