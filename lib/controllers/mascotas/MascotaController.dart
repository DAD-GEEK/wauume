import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wauume/controllers/mascotas/MascotasProvider.dart';
import 'package:wauume/models/MascotaModel.dart';

class MascotaController {

  FirebaseFirestore db = FirebaseFirestore.instance;
  final String collection = 'tasks';

  Future<String?> createPet(GlobalKey<FormState> _key,
    {required dynamic photo, required String? carnetVacunacion, required String? nombre, required dynamic categoria, required String? tamano, required int? edad, required String? raza,
    required MascotasProvider provider,
    required BuildContext context}) async {
  try {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();
      if (photo != null && carnetVacunacion != null && nombre != null && categoria != null && tamano != null && edad != null && raza != null) {
        MascotaModel pet = MascotaModel(photo: photo, carnetVacunacion: carnetVacunacion, nombre: nombre, edad: edad, raza: raza);
        provider.addPet(pet);
        await db.collection(collection).add(pet.toMap());
        Navigator.pop(context);
        return 'Pet created';
      }
    }
  } catch (e) {
    print(e);
    return '';
  }
  return null;
}
  
}

String ? validTextFormtype(value) {
  if (value!.isEmpty || value == null) {
    return "Campo obligatorio";
  }
  return null;
}


void editPet(GlobalKey<FormState> _key,
    {required String? photo, required String? carnetVacunacion, required String? nombre, required String? categoria, required String? tamano, required int? edad, required String? raza,
    required MascotasProvider provider,
    required BuildContext context,
    required int index}) {
  if (_key.currentState!.validate()) {
    _key.currentState!.save();
    if (photo != null && carnetVacunacion != null && nombre != null && categoria != null && tamano != null && edad != null && raza != null) {
      MascotaModel pet = MascotaModel(photo: photo, carnetVacunacion: carnetVacunacion, nombre: nombre, edad: edad, raza: raza);
      provider.editPet(index, pet);
      Navigator.pop(context);
    }
  }
}
