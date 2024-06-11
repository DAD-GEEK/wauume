import 'package:flutter/material.dart';
import 'package:wauume/models/MascotaModel.dart';

class MascotasProvider extends ChangeNotifier{
  final List<MascotaModel> _pets = [];
  List<MascotaModel> get pets => _pets;


  void addPet(MascotaModel pet){
    _pets.add(pet);
    notifyListeners();
  }
  void deletePet(int index) {
    _pets.removeAt(index);
    notifyListeners();
  }

  void editPet(int index, MascotaModel pet){
    _pets[index] = pet;
    notifyListeners();
  }

  void updatePet(int index, MascotaModel pet){
    _pets[index] = pet;
    notifyListeners();
  }

}

