import 'dart:convert';

import 'package:app_coleta_lixo/data_api/http/exceptions.dart';
import 'package:app_coleta_lixo/data_api/http/http_client.dart';
import 'package:app_coleta_lixo/data_api/models/usuario_model.dart';

abstract class IUsuarioRepository {
  Future<Profile> criarUsuario(
      {required String username,
      required String first_name,
      required String last_name,
      required String email,
      required String password,
      required String telefone,
      required List<String> user_types});
}

class UsuarioRepository implements IUsuarioRepository {
  final IHttpClient client;
  UsuarioRepository({required this.client});

  @override
  Future<Profile> criarUsuario(
      {required String username,
      required String first_name,
      required String last_name,
      required String email,
      required String password,
      required String telefone,
      required List<String> user_types}) async {
    final data = {
      "user": {
        "username": username,
        "first_name": first_name,
        "last_name": last_name,
        "email": email,
        "password": password,
      },
      "telefone": telefone,
      "user_types": user_types,
    };

    final response = await client.post(
        url: 'http://127.0.0.1:8000/api/user/add/', data: data);

    if (response.statusCode == 200) {
      print("Fiz requisição do usuário");

      Map<String, dynamic> body = jsonDecode(response.body);
      final Profile usuario = Profile.fromMap(body);
      return usuario;
    } else if (response.statusCode == 404) {
      throw NotFoundException('A url informada não é válida');
    } else {
      throw Exception('Não foi possível carregar as ofertas');
    }
  }
}
