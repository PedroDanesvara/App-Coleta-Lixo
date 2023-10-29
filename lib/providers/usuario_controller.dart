import 'package:app_coleta_lixo/data_api/http/exceptions.dart';
import 'package:app_coleta_lixo/data_api/models/usuario_model.dart';
import 'package:app_coleta_lixo/data_api/repositories/usuario_repository.dart';
import 'package:flutter/material.dart';

class UsuarioController {
  final IUsuarioRepository repository;

  final ValueNotifier<String> erro = ValueNotifier<String>('');

  UsuarioController({required this.repository});

  Future criarUsuario(
      {required String username,
      required String first_name,
      required String last_name,
      required String email,
      required String password,
      required String telefone,
      required List<String> user_types}) async {
    try {
      await repository.criarUsuario(
          username: username,
          first_name: first_name,
          last_name: last_name,
          email: email,
          password: password,
          telefone: telefone,
          user_types: user_types);
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      print(e);
      erro.value = e.toString();
    }
  }

  Future atualizarUsuario(
      {required String? cpf,
    required DateTime? dt_nascimento,
    required String? endereco,
    required int? n_coletas,
    required String? perfil}) async {
    try {
      await repository.atualizarUsuario(
          cpf: cpf,
          dt_nascimento: dt_nascimento,
          endereco: endereco,
          n_coletas: n_coletas,
          perfil: perfil);
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      print(e);
      erro.value = e.toString();
    }
  }

  Future deletarUsuario() async {
    try {
      await repository.deletarUsuario();
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      print(e);
      erro.value = e.toString();
    }
  }
}