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

  Future atualizarUsuarioNome(
      {required String username,
      required String first_name,
      required String last_name}) async {
    try {
      await repository.atualizarUsuarioNome(
          username: username,
          first_name: first_name,
          last_name: last_name);
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      print(e);
      erro.value = e.toString();
    }
  }

  Future atualizarUsuarioEmail(
      {required String email}) async {
    try {
      await repository.atualizarUsuarioEmail(
          email: email);
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      print(e);
      erro.value = e.toString();
    }
  }

  Future atualizarUsuarioTelefone(
      {required String telefone}) async {
    try {
      await repository.atualizarUsuarioTelefone(
          telefone: telefone);
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      print(e);
      erro.value = e.toString();
    }
  }

  Future atualizarUsuarioCpf(
      {required String cpf}) async {
    try {
      await repository.atualizarUsuarioCpf(
          cpf: cpf);
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      print(e);
      erro.value = e.toString();
    }
  }

  Future atualizarUsuarioPassword(
      {required String password}) async {
    try {
      await repository.atualizarUsuarioPassword(
          password: password);
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      print(e);
      erro.value = e.toString();
    }
  }

  Future atualizarUsuarioDataNascimento(
      {required String dt_nascimento}) async {
    try {
      await repository.atualizarUsuarioDataNascimento(
          dt_nascimento: dt_nascimento);
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