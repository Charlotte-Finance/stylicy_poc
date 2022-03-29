import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'http_exceptions.dart';

class HttpRequest {
  //final String _address = kIsWeb ? "127.0.0.1" : "10.0.2.2";
  static const _host = 'fakestoreapi.com';
  //static const int _port = 8080;
  static const int? _port = null;
  static final Map<String, String> _headers = <String, String>{
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Content-Language': 'en',
  };

  static Future<dynamic> getRequest({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    Uri httpRequest = getUri(
      endpoint: endpoint,
      queryParameters: queryParameters,
    );
    try {
      print(httpRequest);
      final response = await http.get(
        httpRequest,
        headers: _headers,
      );

      return _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  static Future<dynamic> postRequest(
      {required String endpoint, required String jsonBody}) async {
    Uri httpRequest = getUri(
      endpoint: endpoint,
    );
    try {
      final response = await http.post(
        httpRequest,
        headers: _headers,
        body: jsonBody,
      );
      return _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> deleteRequest({required String endpoint}) async {
    Uri httpRequest = getUri(
      endpoint: endpoint,
    );

    try {
      final response = await http.delete(
        httpRequest,
        headers: _headers,
      );
      return _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  static Uri getUri({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) {
    return Uri(
      scheme: "https",
      path: endpoint,
      port: _port,
      host: _host,
      queryParameters: queryParameters,
    );
  }

  static dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
          'Error occurred while Communication with Server with StatusCode : ${response.statusCode}',
        );
    }
  }
}
