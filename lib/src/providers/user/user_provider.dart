import 'package:double_d_test/src/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  late User user;

  final _name = TextEditingController();
  final _lastName = TextEditingController();
  DateTime _age = DateTime.now();

  submit() {
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      user = User(name: _name.text, lastName: _lastName.text, age: _age);
      return true;
    }
    return false;
  }

  handleAge(DateTime age) {
    _age = age;
    notifyListeners();
  }

  clearData() {
    _name.text = '';
    _lastName.text = '';
    _age = DateTime.now();
    user = User(name: _name.text, lastName: _lastName.text, age: _age);
    notifyListeners();
  }

  GlobalKey get formKey => _formKey;
  TextEditingController get name => _name;
  TextEditingController get lastName => _lastName;
  DateTime get age => _age;
}
