import 'package:flutter/material.dart';

class SignUpScreenViewModel extends ChangeNotifier {
  String? validator(String? value, String form) {
    if (value!.isEmpty) {
      return '$form is required';
    }

    notifyListeners();
    return null;
  }
}
