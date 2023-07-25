//Paleta de cores para o programa

import 'package:flutter/material.dart';

//Cor principal do aplicativo
const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFE8F2EE),
  100: Color(0xFFC7DFD5),
  200: Color(0xFFA1CAB9),
  300: Color(0xFF7BB49C),
  400: Color(0xFF5FA487),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFF3D8C6A),
  700: Color(0xFF34815F),
  800: Color(0xFF2C7755),
  900: Color(0xFF1E6542),
});
const int _primaryPrimaryValue = 0xFF439472;

const MaterialColor primaryAccent =
    MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFFA3FFD0),
  200: Color(_primaryAccentValue),
  400: Color(0xFF3DFF9B),
  700: Color(0xFF24FF8E),
});
const int _primaryAccentValue = 0xFF70FFB6;

//Cor do ''OU'' na página de Login, sim isso mesmo!!!

const MaterialColor loginOr = MaterialColor(_loginOrPrimaryValue, <int, Color>{
  50: Color(0xFFEDEDED),
  100: Color(0xFFD3D3D3),
  200: Color(0xFFB5B5B5),
  300: Color(0xFF979797),
  400: Color(0xFF818181),
  500: Color(_loginOrPrimaryValue),
  600: Color(0xFF636363),
  700: Color(0xFF585858),
  800: Color(0xFF4E4E4E),
  900: Color(0xFF3C3C3C),
});
const int _loginOrPrimaryValue = 0xFF6B6B6B;

const MaterialColor loginOrAccent =
    MaterialColor(_loginOrAccentValue, <int, Color>{
  100: Color(0xFFF5A2A2),
  200: Color(_loginOrAccentValue),
  400: Color(0xFFFF3131),
  700: Color(0xFFFF1818),
});
const int _loginOrAccentValue = 0xFFF07474;

//Mesma coisa de cima só que com outro nome, pois eu não queria usar o mesmo nome da constante

const MaterialColor grayScale =
    MaterialColor(_grayScalePrimaryValue, <int, Color>{
  50: Color(0xFFEDEDED),
  100: Color(0xFFD3D3D3),
  200: Color(0xFFB5B5B5),
  300: Color(0xFF979797),
  400: Color(0xFF818181),
  500: Color(_grayScalePrimaryValue),
  600: Color(0xFF636363),
  700: Color(0xFF585858),
  800: Color(0xFF4E4E4E),
  900: Color(0xFF3C3C3C),
});
const int _grayScalePrimaryValue = 0xFF6B6B6B;

const MaterialColor grayScaleAccent =
    MaterialColor(_grayScaleAccentValue, <int, Color>{
  100: Color(0xFFF5A2A2),
  200: Color(_grayScaleAccentValue),
  400: Color(0xFFFF3131),
  700: Color(0xFFFF1818),
});
const int _grayScaleAccentValue = 0xFFF07474;
