import 'dart:convert';

import 'package:app_coleta_lixo/data_api/http/exceptions.dart';
import 'package:app_coleta_lixo/data_api/http/http_client.dart';

abstract class IAuthTokenRepository {
  Future<String> getToken({required String username, required String password,});
}

class AuthTokenRepository implements IAuthTokenRepository {
  
  final IHttpClient client;
  AuthTokenRepository({required this.client});
  
  @override
  Future<String> getToken({required String username, required String password,}) async {
    
    final data = {
      "username": username,
      "password": password,
    };

    final response = await client.post(
      url: 'http://127.0.0.1:8000/obtain-token/',
      data: data,
    );

    if (response.statusCode >= 200 && response.statusCode < 300){
      print("Requisição de token deu CERTO");
      final body = jsonDecode(response.body);
      return body['token'];
    }
    else if(response.statusCode == 404){
      print("deu erro 404");
      throw NotFoundException('A url informada não é válida');
    }
    else{
      print("Deu algum erro ai");
      throw Exception('Não foi possível obter o token');
    }
  }
}