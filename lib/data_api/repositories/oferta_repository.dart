import 'dart:convert';

import 'package:app_coleta_lixo/data_api/http/exceptions.dart';
import 'package:app_coleta_lixo/data_api/http/http_client.dart';
import 'package:app_coleta_lixo/data_api/models/oferta_model.dart';


abstract class IOfertaRepository {
  Future<List<OfertaModel>> getOfertas();
}

class OfertaRepository implements IOfertaRepository {

  final IHttpClient client;
  OfertaRepository({required this.client});

  @override
  Future<List<OfertaModel>> getOfertas() async {
    final response = await client.get(
      url: 'http://127.0.0.1:8000/ofertas/ofertas/',
    );

    if (response.statusCode == 200) {
      final List<OfertaModel> ofertas = [];

      final body = jsonDecode(response.body);
      body['results'].map((item) {
        final OfertaModel oferta = OfertaModel.fromMap(item);
        ofertas.add(oferta);
      }).toList();

      return ofertas;
    }
    else if(response.statusCode == 404) {
      throw NotFoundException('A url informada não é válida');
    }
    else{
      throw Exception('Não foi possível carregar as ofertas');
    }
  }
}
