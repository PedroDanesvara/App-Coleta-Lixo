import 'package:app_coleta_lixo/data_api/http/exceptions.dart';
import 'package:app_coleta_lixo/data_api/models/oferta_model.dart';
import 'package:app_coleta_lixo/data_api/repositories/oferta_repository.dart';
import 'package:flutter/material.dart';

class OfertaController {
  final IOfertaRepository repository;
  
  //Variável reativa para o estado de loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  //Variável reativa para o estado de mostrar ofertas na página
  final ValueNotifier<List<OfertaModel>> ofertas = 
  ValueNotifier<List<OfertaModel>>([]);


  //Variável reativa para os erros que acontecerem na tela
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  OfertaController({required this.repository});

  Future<void> getOfertas() async {
    isLoading.value = true;

    try {
      final result = await repository.getOfertas();
      ofertas.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    }
    catch (e) {
      print(e);
      erro.value = e.toString();
    }

    isLoading.value = false;
  }


  Future createOferta({required String tipoMaterial,
                       required String peso,
                       required String valor,
                       required String agendamento}) async {

    try {
      print("Após clicar em criar oferta");
      await repository.createOferta(tipoMaterial: tipoMaterial, 
                                    estado: "nao_informado", 
                                    peso: double.parse(peso), 
                                    valor: double.parse(valor), 
                                    idProdutor: 1, 
                                    gpsCoord: "nao_informado",
                                    agendamento: agendamento,);
    } catch (e) {
      print(e);
    }
  }


  Future deleteOferta({required int idOferta}) async {
  
    try{
      await repository.deleteOferta(idOferta: idOferta);
    } on NotFoundException catch (e) {
      erro.value = e.message;
    }
    catch (e) {
      print(e);
    }
  }
}