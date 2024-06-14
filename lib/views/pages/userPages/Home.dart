import 'package:flutter/material.dart';
import 'package:wauume/controllers/login/LoginController.dart';
import 'package:wauume/views/pages/userPages/Busqueda.dart';
import 'package:wauume/views/pages/userPages/Favoritos.dart';
import 'package:wauume/views/pages/userPages/Mascotas/Mascotas.dart';
import 'package:wauume/views/pages/userPages/Perfil.dart';
import 'package:wauume/views/widgets/Buttons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _categoriaActiva = 0;
  static var paginas = <Widget>[
    Busqueda(),
    Favoritos(),
    Mascotas(),
    Perfil(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: newLogo(250, 31),
      leading: IconButton(
        icon: const Icon(Icons.notifications_none_outlined),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            logout(context);
          
          },
        ),
      ]),
      body: paginas[_categoriaActiva],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: const Color(0xffDB3500),
        unselectedItemColor: const Color.fromARGB(255, 23, 22, 22),
        currentIndex: _categoriaActiva,
        onTap: _alPulsar,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Busqueda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Mascotas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }



  void _alPulsar(int indice) {
    setState(() => _categoriaActiva = indice);
  }
}
