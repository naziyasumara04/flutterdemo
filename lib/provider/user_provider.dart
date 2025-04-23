import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  String name;
  UserProvider({this.name="naziya"});


  void updateName({required String newName}){
    name=newName;
    notifyListeners();
  }

}