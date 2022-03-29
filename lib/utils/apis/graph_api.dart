import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'http_exceptions.dart';

class GraphAPI {
  static const _host = 'graph.facebook.com';

  static Future<dynamic> getProfile({
    required String? endpoint,
    String? query,
    Map<String, dynamic>? queryParameters,
  }) async {
    Uri httpRequest = Uri(
      scheme: "https",
      host: _host,
      path: endpoint,
      query: query,
      queryParameters: queryParameters,
    );
    try {
      print(httpRequest);
      final response = await http.get(
        httpRequest,
      );

      return _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
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
