import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool isLoading = false;
  String? selectedRole;
  String errorMessage = '';

  final List<String> roles = ['Admin', 'Super Admin', 'User'];

  void selectRole(String role) {
    selectedRole = role;
    notifyListeners();
  }

  Future<void> login(String username, String password) async {
    if (selectedRole == null) {
      errorMessage = "Please select a role.";
      notifyListeners();
      return;
    }

    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Mock success logic based on role
      if (username == "admin" && password == "password" && selectedRole == "Admin") {
        errorMessage = '';
      } else if (username == "superadmin" && password == "password" && selectedRole == "Super Admin") {
        errorMessage = '';
      } else if (username == "user" && password == "password" && selectedRole == "User") {
        errorMessage = '';
      } else {
        throw Exception("Invalid credentials or role.");
      }

    } catch (e) {
      errorMessage = e.toString().replaceAll('Exception: ', '');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
