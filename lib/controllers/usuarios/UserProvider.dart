import 'package:flutter/material.dart';
import 'package:wauume/models/userModel.dart';

class Userprovider extends ChangeNotifier{
  final List<UserModel> _users = [];
  List<UserModel> get users => _users;

  void addUser(UserModel user){
    _users.add(user);
    notifyListeners();
  }
  void deleteUser(int index) {
    _users.removeAt(index);
    notifyListeners();
  }

  void editUser(int index, UserModel user){
    _users[index] = user;
    notifyListeners();
  }

}

