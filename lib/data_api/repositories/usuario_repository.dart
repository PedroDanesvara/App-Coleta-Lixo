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

  atualizarUsuarioNome(
      {required String username,
      required String first_name,
      required String last_name});

  atualizarUsuarioEmail(
      {required String email});

  atualizarUsuarioTelefone(
      {required String telefone});

  atualizarUsuarioCpf(
      {required String cpf});
    
  atualizarUsuarioPassword(
      {required String password});
    
  atualizarUsuarioDataNascimento(
      {required String dt_nascimento});
  
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
      throw Exception('Não foi possível criar o usuário');
    }
  }

  @override
  atualizarUsuarioNome(
      {required String username,
      required String first_name,
      required String last_name}) async {
    final data = {
      "username": username,
      "first_name": first_name,
      "last_name": last_name
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
      throw Exception('Não foi possível atualizar o nome do usuário');
    }
  }

  @override
  atualizarUsuarioEmail(
      {required String email}) async {
    final data = {
      "email": email
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
      throw Exception('Não foi possível atualizar o email do usuário');
    }
  }

  @override
  atualizarUsuarioTelefone(
      {required String telefone}) async {
    final data = {
      "telefone": telefone
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
      throw Exception('Não foi possível atualizar o telefone do usuário');
    }
  }

  @override
  atualizarUsuarioCpf(
      {required String cpf}) async {
    final data = {
      "cpf": cpf
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
      throw Exception('Não foi possível atualizar o cpf do usuário');
    }
  }

  @override
  atualizarUsuarioPassword(
      {required String password}) async {
    final data = {
      "password": password
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
      throw Exception('Não foi possível atualizar o password do usuário');
    }
  }

  @override
  atualizarUsuarioDataNascimento(
      {required String dt_nascimento}) async {
    final data = {
      "dt_nascimento": dt_nascimento
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
      throw Exception('Não foi possível atualizar a data de nascimento do usuário');
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
      throw Exception('Não foi possível deletar o usuário');
    }
  }
}