import 'package:app_coleta_lixo/data_api/http/exceptions.dart';
import 'package:app_coleta_lixo/data_api/repositories/auth_token_repository.dart';
import 'package:flutter/material.dart';

class LoginController {
  final IAuthTokenRepository repository;

  final ValueNotifier<String> token = ValueNotifier<String>('');

  final ValueNotifier<String> erro = ValueNotifier<String>('');

  
  LoginController({required this.repository});

  Future getToken({required String username, required String password,}) async {
    try {
      final result = await repository.getToken(username: username, password: password);
      print("Resultado ${result}");
      token.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    }
    catch (e) {
      print(e);
      erro.value = e.toString();
    }
  }
}