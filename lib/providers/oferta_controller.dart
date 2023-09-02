import 'package:app_coleta_lixo/data_api/http/exceptions.dart';
import 'package:app_coleta_lixo/data_api/models/oferta_model.dart';
import 'package:app_coleta_lixo/data_api/repositories/oferta_repository.dart';
import 'package:flutter/material.dart';

class OfertaController {
  final IOfertaRepository repository;
  
  //Variável reativa para o estado de loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  //Variável reativa para o estado de mostrar ofertas na página
  final ValueNotifier<List<OfertaModel>> state = 
  ValueNotifier<List<OfertaModel>>([]);


  //Variável reativa para os erros que acontecerem na tela
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  OfertaController({required this.repository});

  Future getOfertas() async {
    isLoading.value = true;

    try {
      final result = await repository.getOfertas();
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.massage;
    }
    catch (e) {
      print(e);
      erro.value = e.toString();
    }

    isLoading.value = false;
  }
}