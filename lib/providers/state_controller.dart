import 'package:flutter/material.dart';

//Controlador geral dos widgets do aplicativo
class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  bool isDarkTheme = false;

  bool isSignUpCheckboxConfirmed = false;

  bool catadorState = false;
  bool coletorState = false;
  bool sucatariaState = false;
  bool occupationState = false;

  int bottomNotifications = 0;

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

  //Funções para alterar o estado dos Buttons da segunda página de cadastro
  catadorSet() {
    catadorState = !catadorState;
    notifyListeners();
  }

  coletorSet() {
    coletorState = !coletorState;
    notifyListeners();
  }

  sucatariaSet() {
    sucatariaState = !sucatariaState;
    notifyListeners();
  }

  occupationSet() {
    occupationState = !occupationState;
    notifyListeners();
  }
}
