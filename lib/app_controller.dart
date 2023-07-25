import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  bool isDarkTheme = false;
  bool isCheckboxConfirmed = false;

  //Função para alterar estado do switch de Dark Mode
  changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  //Função para alterar estado da Checbox da página de cadastro
  checkboxSet() {
    isCheckboxConfirmed = !isCheckboxConfirmed;
    notifyListeners();
  }
}
