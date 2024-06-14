
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wauume/controllers/mascotas/MascotasProvider.dart';
import 'package:wauume/models/MascotaModel.dart';
import 'package:wauume/views/widgets/Buttons.dart';

class EditMascota extends StatefulWidget {
  final int index;
  const EditMascota({super.key, required this.index});

  @override
  State<EditMascota> createState() => _EditPetPageState();
}

class _EditPetPageState extends State<EditMascota> {
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    int index = widget.index;
    return Scaffold(
      appBar: Appbar(),
      body: Consumer<MascotasProvider>(
          builder: (context, petProvider, child) => PetForm(petProvider,index)),
    );
  }

  Form PetForm(MascotasProvider petProvider,int index) {
    List<MascotaModel> pets = petProvider.pets;
    return Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            
            TextFormField(
              initialValue: pets[index].nombre,
              decoration: const InputDecoration(labelText: 'Nombre'),
              onSaved: (value) {
                pets[index].nombre = value!;
              },
            ),
            TextFormField(
              initialValue: pets[index].raza,
              decoration: const InputDecoration(labelText: 'Raza'),
              onSaved: (value) {
                pets[index].raza = value!;
              },
            ),
            TextFormField(
              initialValue: pets[index].edad.toString(),
              decoration: const InputDecoration(labelText: 'Edad'),
              onSaved: (value) {
                pets[index].edad = int.parse(value!);
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_key.currentState!.validate()) {
                  _key.currentState!.save();
                  petProvider.updatePet(index, pets[index]);
                  Navigator.pop(context);
                }
              },
              child: const Text('Guardar'),
            )
          ],
        ),
      ),
    );
  }
}
