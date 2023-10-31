import 'dart:convert';
import 'dart:io';
import 'package:app_coleta_lixo/data_api/http/exceptions.dart';
import 'package:app_coleta_lixo/data_api/http/http_client.dart';
import 'package:app_coleta_lixo/data_api/models/oferta_model.dart';
import 'package:app_coleta_lixo/widgets/local_storage.dart';


abstract class IOfertaRepository {
  Future<List<OfertaModel>> getOfertas();
  deleteOferta({required int idOferta});
}

class OfertaRepository implements IOfertaRepository {

  final IHttpClient client;
  OfertaRepository({required this.client});

  @override
  Future<List<OfertaModel>> getOfertas() async {
    final response = await client.get(
      url: 'http://127.0.0.1:8000/ofertas/',
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print("Fiz requisição pra listar as ofertas");
      final List<OfertaModel> ofertas = [];

      Map<String, dynamic> body = jsonDecode(response.body);
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

  @override
  deleteOferta({required int idOferta}) async {
    LocalStorage localStorage = LocalStorage();

    final url = 'http://127.0.0.1:8000/ofertas/${idOferta}/';
    final token = await localStorage.loadFromPrefs(keyName: "storageToken");
    
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": token,
    };

    final response = await client.delete(url: url, headers: headers);
    
    if(response.statusCode >= 200 && response.statusCode < 300){
      print("Oferta de id ${idOferta} foi deletado!");
    }
    else if(response.statusCode == 404) {
      throw NotFoundException('A url informada não é válida');
    }
    else{
      throw Exception('Não foi possível deletar a oferta');
    }
  }
}