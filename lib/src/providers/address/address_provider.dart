import 'package:flutter/material.dart';

class AddressProvider with ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  List<String> _addresses = [];
  final _address = TextEditingController();
  int _principal = 0;

  setAddress(String text) {
    _addresses.add(text);
    _address.text = '';
    notifyListeners();
  }

  submit() {
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      setAddress(_address.text);
    }
  }

  handleUpdatePrincipal(int value) {
    _principal = value;
    notifyListeners();
  }

  getPrincipalAddress() => _addresses[_principal];

  clearAddresses() {
    _addresses = [];
    _principal = 0;
    notifyListeners();
  }

  List<String> get addresses => _addresses;
  TextEditingController get address => _address;
  GlobalKey get formKey => _formKey;
  int get principal => _principal;
}
