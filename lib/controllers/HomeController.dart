import 'package:flutter/material.dart';
import 'package:wauume/views/pages/userPages/Busqueda.dart';
import 'package:wauume/views/pages/userPages/Favoritos.dart';
import 'package:wauume/views/pages/userPages/Mascotas/Mascotas.dart';
import 'package:wauume/views/pages/userPages/Perfil.dart';


loadNewSection(GlobalKey<FormState> formKey,BuildContext context, String page) {

  final pageRoutes = {
    'Busqueda': () => const Busqueda(),
    'Favoritos': () => const Favoritos(),
    'Mascotas': () => Mascotas(),
    'Perfil' : () => const Perfil(),
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