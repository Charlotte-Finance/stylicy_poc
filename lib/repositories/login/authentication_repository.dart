import 'dart:async';
import 'dart:convert';

import '../../utils/http/http_request.dart';
import '../../utils/storage/secure_storage.dart';


enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final String url = "/auth/";

  final _storage = SecureStorage();
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    String? token = await _storage.readSecureData('token');
    yield token == null ?  AuthenticationStatus.unauthenticated : AuthenticationStatus.authenticated ;
    yield* _controller.stream;
  }

  Future<void> logIn({required String username, required String password}) async {
    String jsonBody = jsonEncode(<String, String>{
      'username': 'mor_2314',
      'password': '83r5^_',
    });
    final response = await HttpRequest.postRequest(
      endpoint: url + "login/",
      jsonBody: jsonBody,
    );
    _storage.writeSecureData('token', response['token']);
    _controller.add(AuthenticationStatus.authenticated);
  }

  logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
    _storage.deleteSecureData('token');
  }

  void dispose() => _controller.close();
}
