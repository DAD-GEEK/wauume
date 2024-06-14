import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wauume/controllers/mascotas/MascotaController.dart';
import 'package:wauume/controllers/mascotas/MascotasProvider.dart';


class NewMascotaPage extends StatefulWidget {
  @override
  State<NewMascotaPage> createState() => _CreateMascotaPageState();
}

class _CreateMascotaPageState extends State<NewMascotaPage> {
  GlobalKey<FormState> _key = GlobalKey();

  dynamic photo;
  dynamic carnetVacunacion;
  String? nombre;
  List<String> categoria = <String>[
    "Perro",
    "Gato",
    "Ave",
    "Roedor",
    "Reptil",
    "Pez"
  ];
  List<String> tamano = <String>["Pequeño", "Mediano", "Grande"];
  int? edad;
  String? raza;
  MascotaController _petController = MascotaController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MascotasProvider>(
          builder: (context, petProvider, child) => PetForm(petProvider)),
    );
  }

  Form PetForm(MascotasProvider petProvider) {
    return Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nombre'),
              onSaved: (value) {
                nombre = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Raza'),
              onSaved: (value) {
                raza = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Edad'),
              onSaved: (value) {
                edad = int.parse(value!);
              },
            ),
            ElevatedButton(
              onPressed:()=> _petController.createPet(
                  _key,
                  photo: photo,
                  carnetVacunacion: carnetVacunacion,
                  nombre: nombre,
                  categoria: categoria,
                  tamano: "",
                  edad: edad,
                  raza: raza,
                  provider: petProvider,
                  context: context,
              ),
              child: const Text('Guardar'),
            )
          ],
        ),
      ),
    );
  }
}
