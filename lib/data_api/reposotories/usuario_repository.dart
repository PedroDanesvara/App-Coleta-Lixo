import 'package:app_coleta_lixo/data_api/http/exceptions.dart';
import 'package:app_coleta_lixo/data_api/http/http_client.dart';
import 'package:app_coleta_lixo/pages/account_auth/signup_page.dart';

abstract class IUsuarioRepository {
  criarUsuario(
      {required String username,
      required String first_name,
      required String last_name,
      required String email,
      required String password,
      required String telefone,
      required List<String> user_types});

  atualizarUsuario(
      {required String? cpf,
      required DateTime? dt_nascimento,
      required String? endereco,
      required int? n_coletas,
      required String? perfil});

  deletarUsuario();
}

class UsuarioRepository implements IUsuarioRepository {
  final IHttpClient client;
  UsuarioRepository({required this.client});

  @override
  criarUsuario(
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

    print(data);

    final response = await client.post(
        url: 'http://127.0.0.1:8000/api/user/add/', data: data);

    if (response.statusCode == 201) {
      print("Fiz requisição para API e criei o usuário");
    } else if (response.statusCode == 404) {
      throw NotFoundException('A url informada não é válida');
    } else {
      throw Exception('Não foi possível carregar as ofertas');
    }
  }

  @override
  atualizarUsuario(
      {required String? cpf,
      required DateTime? dt_nascimento,
      required String? endereco,
      required int? n_coletas,
      required String? perfil}) async {
    final data = {
      "cpf": cpf,
      "dt_nascimento": dt_nascimento,
      "endereco": endereco,
      "n_coletas": n_coletas,
      "perfil": perfil
    };

    print(data);

    final response = await client.patch(
        url: 'http://127.0.0.1:8000/api/user/detail/${SignUpPage.name}/',
        data: data);

    if (response.statusCode == 200) {
      print("Fiz requisição para API e atualizei o usuário");
    } else if (response.statusCode == 404) {
      throw NotFoundException('A url informada não é válida');
    } else {
      throw Exception('Não foi possível carregar as ofertas');
    }
  }

  @override
  deletarUsuario() async {
    final response = await client.delete(
        url: 'http://127.0.0.1:8000/api/user/detail/${SignUpPage.name}/');

    if (response.statusCode == 200) {
      print("Fiz requisição para API e deletei o usuário");
    } else if (response.statusCode == 404) {
      throw NotFoundException('A url informada não é válida');
    } else {
      throw Exception('Não foi possível carregar as ofertas');
    }
  }
}