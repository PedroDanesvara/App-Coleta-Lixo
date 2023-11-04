import 'dart:convert';
import 'dart:io';
import 'package:app_coleta_lixo/data_api/http/exceptions.dart';
import 'package:app_coleta_lixo/data_api/http/http_client.dart';
import 'package:app_coleta_lixo/data_api/models/oferta_model.dart';
import 'package:app_coleta_lixo/pages/bottom_bar_pages/create_offer_page.dart';
import 'package:app_coleta_lixo/widgets/local_storage.dart';
import 'package:provider/provider.dart';


abstract class IOfertaRepository {
  Future<List<OfertaModel>> getOfertas();

  createOferta({required String tipoMaterial,
                required String estado,
                required double peso,
                required double valor,
                required int idProdutor,
                required String gpsCoord,
                required String agendamento,});

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
  createOferta({required String tipoMaterial,
                required String estado,
                required double peso,
                required double valor,
                required int idProdutor,
                required String gpsCoord,
                required String agendamento,}) async {

    LocalStorage localStorage = LocalStorage();

    const url = 'http://127.0.0.1:8000/ofertas/';
    final token = await localStorage.loadFromPrefs(keyName: "storageToken");
    
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8",
      "Authorization": token,
    };                  

    Map<String, dynamic> data = {
      "tipo_material": tipoMaterial,
      "estado": estado,
      "peso": peso.toString(),
      "valor": valor.toString(),
      "produtor": idProdutor.toString(),
      "gps_coord": gpsCoord,
      "agendamento": agendamento,
    };  
    print("Pronto pra enviar requisição de criar");
    final response = await client.post(url: url, headers: headers, data: data);
    print("Requisição de criar, enviada");
    if (response.statusCode >= 200 && response.statusCode < 300){
      print("Oferta criada com sucesso!");
      final body = jsonDecode(response.body);
      return body;
    }
    else if(response.statusCode == 404){
      print("deu erro 404");
      throw NotFoundException('A url informada não é válida');
    }
    else{
      print("Deu algum erro ai");
      throw Exception('Não foi possível criar a Oferta!');
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