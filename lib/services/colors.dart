//Paleta de cores para o programa

import 'package:flutter/material.dart';

class MyColors {
//Cor principal do aplicativo, paleta de cor em uma escala de verde
  static const MaterialColor primary = MaterialColor(
    _primaryPrimaryValue,
    <int, Color>{
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
    },
  );
  static const int _primaryPrimaryValue = 0xFF439472;

  static const MaterialColor primaryAccent = MaterialColor(
    _primaryAccentValue,
    <int, Color>{
      100: Color(0xFFA3FFD0),
      200: Color(_primaryAccentValue),
      400: Color(0xFF3DFF9B),
      700: Color(0xFF24FF8E),
    },
  );
  static const int _primaryAccentValue = 0xFF70FFB6;

//Paleta de cor em uma escala de cinza
  static const MaterialColor grayScale = MaterialColor(
    _grayScalePrimaryValue,
    <int, Color>{
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
    },
  );
  static const int _grayScalePrimaryValue = 0xFF6B6B6B;

  static const MaterialColor grayScaleAccent = MaterialColor(
    _grayScaleAccentValue,
    <int, Color>{
      100: Color(0xFFF5A2A2),
      200: Color(_grayScaleAccentValue),
      400: Color(0xFFFF3131),
      700: Color(0xFFFF1818),
    },
  );
  static const int _grayScaleAccentValue = 0xFFF07474;

//Paleta de cor em uma escala de azul claro
  static const MaterialColor lightBlueScale = MaterialColor(
    _lightBlueScalePrimaryValue,
    <int, Color>{
      50: Color(0xFFE2FAFC),
      100: Color(0xFFB6F2F8),
      200: Color(0xFF85E9F3),
      300: Color(0xFF54E0EE),
      400: Color(0xFF2FDAEB),
      500: Color(_lightBlueScalePrimaryValue),
      600: Color(0xFF09CEE4),
      700: Color(0xFF07C8E0),
      800: Color(0xFF05C2DD),
      900: Color(0xFF03B7D7),
    },
  );
  static const int _lightBlueScalePrimaryValue = 0xFF0AD3E7;

  static const MaterialColor lightBlueScaleAccent = MaterialColor(
    _lightBlueScaleAccentValue,
    <int, Color>{
      100: Color(0xFFFEFFFF),
      200: Color(_lightBlueScaleAccentValue),
      400: Color(0xFF98EEFF),
      700: Color(0xFF7FEAFF),
    },
  );
  static const int _lightBlueScaleAccentValue = 0xFFCBF6FF;

//Paleta de cor de uma escala de cinza escuro
  static const MaterialColor darkGrayScale = MaterialColor(
    _darkGrayScalePrimaryValue,
    <int, Color>{
      50: Color(0xFFE5E5E5),
      100: Color(0xFFBFBFBF),
      200: Color(0xFF959595),
      300: Color(0xFF6A6A6A),
      400: Color(0xFF4A4A4A),
      500: Color(_darkGrayScalePrimaryValue),
      600: Color(0xFF252525),
      700: Color(0xFF1F1F1F),
      800: Color(0xFF191919),
      900: Color(0xFF0F0F0F),
    },
  );
  static const int _darkGrayScalePrimaryValue = 0xFF2A2A2A;

  static const MaterialColor darkGrayScaleAccent = MaterialColor(
    _darkGrayScaleAccentValue,
    <int, Color>{
      100: Color(0xFFEE6767),
      200: Color(_darkGrayScaleAccentValue),
      400: Color(0xFFF00000),
      700: Color(0xFFD60000),
    },
  );
  static const int _darkGrayScaleAccentValue = 0xFFE93A3A;
}
