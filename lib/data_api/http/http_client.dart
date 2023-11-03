import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future get({required String url});
  Future post({required String url, Map<String, String>? headers, required Map<String, dynamic> data,});
  delete({required String url, required Map<String, String> headers});
}

class HttpClient implements IHttpClient {

  final client = http.Client();

  @override
  Future get({required String url}) async {
    return await client.get(Uri.parse(url),);
  }


  @override
  Future post({required String url, Map<String, String>? headers, required Map<String, dynamic> data}) async {
    if(headers == null || headers.isEmpty){
      return await client.post(Uri.parse(url), body: data,);
    }
    return await client.post(Uri.parse(url), headers: headers, body: jsonEncode(data),);
  }


  @override
  delete({required String url, required Map<String, String> headers}) async {
    return await client.delete(Uri.parse(url), headers: headers);
  }
}