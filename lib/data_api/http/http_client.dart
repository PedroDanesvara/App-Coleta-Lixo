import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future get({required String url});
  Future post({
    required String url,
    required Map<String, dynamic> data,
  });
  Future patch({
    required String url,
    required Map<String, dynamic> data,
  });
  Future delete({required String url});
}

class HttpClient implements IHttpClient {
  final client = http.Client();

  @override
  Future get({required String url}) async {
    return await client.get(
      Uri.parse(url),
    );
  }

  @override
  Future post({required String url, required Map<String, dynamic> data}) async {
    return await client.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
  }

  @override
  Future patch({required String url, required Map<String, dynamic> data}) async {
    return await client.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
  }

  @override
  Future delete({required String url}) async {
    return await client.get(
      Uri.parse(url),
    );
  }
}
