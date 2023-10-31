import 'package:app_coleta_lixo/data_api/http/exceptions.dart';
import 'package:app_coleta_lixo/data_api/repositories/auth_token_repository.dart';
import 'package:app_coleta_lixo/widgets/local_storage.dart';
import 'package:flutter/material.dart';

class LoginController {
  final IAuthTokenRepository repository;

  final ValueNotifier<String> token = ValueNotifier<String>('');

  final ValueNotifier<String> erro = ValueNotifier<String>('');

  LocalStorage localStorage = LocalStorage();

  LoginController({required this.repository});

  Future getToken({required String username, required String password,}) async {
    try {
      final result = await repository.getToken(username: username, password: password);
      token.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.massage;
    }
    catch (e) {
      print(e.toString());
      erro.value = e.toString();
    }

    return token.value;
  }

  verifyTokenToLogin() async {
    bool result = false;
    
      await localStorage.loadFromPrefs(keyName: "storageToken").then((storageToken){
        if(storageToken != null){
          print("Token ja tava salvo oh: ${storageToken}");
          result = true;
        }
        else{
          print("ih rapaz deu nulo, ta salvo não");
          result = false;
        }
      });

      print("retornando do verifyTOken");
      return result;
  }


  saveTokenToLogin({required String keyName, required String value}) async {
    await localStorage.saveToPrefs(
      keyName: keyName, 
      value: value,
    );
  }
}