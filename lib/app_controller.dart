import 'package:flutter/material.dart';

//Controlador geral dos widgets do aplicativo
class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  bool isDarkTheme = false;
  bool isSignUpCheckboxConfirmed = false;
  bool changeSomething = false;

  //Função para alterar estado do switch de Dark Mode
  changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  //Função para alterar estado da Checbox da página de cadastro
  checkboxSet() {
    isSignUpCheckboxConfirmed = !isSignUpCheckboxConfirmed;
    notifyListeners();
  }

  changeBool() {
    changeSomething = !changeSomething;
    notifyListeners();
  }
}
