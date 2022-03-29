import 'dart:async';
import 'dart:convert';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../utils/apis/http_request.dart';
import '../../utils/storage/secure_storage.dart';

enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
  skipped,
  facebook,
  google
}

class AuthenticationRepository {
  final String url = "/auth/";

  final _storage = SecureStorage();
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    String? token = await _storage.readSecureData('token');
    yield token == null
        ? AuthenticationStatus.unauthenticated
        : token == ''
            ? AuthenticationStatus.skipped
            : AuthenticationStatus.authenticated;
    yield* _controller.stream;
  }

  Future<String?> get token async {
    String? token = await _storage.readSecureData('token');
    return token;
  }

  Future<void> skipLogIn() async {
    _storage.writeSecureData('token', '');
    _controller.add(AuthenticationStatus.skipped);
  }

  Future<void> logIn({required String email, required String password}) async {
    // ToDo : real request
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

  Future<void> facebookLogIn() async {
    final LoginResult result = await FacebookAuth.instance.login();
    _storage.writeSecureData('token', result.accessToken!.token);
    _controller.add(AuthenticationStatus.facebook);
  }

  Future<void> googleLogIn() async {

    _controller.add(AuthenticationStatus.google);
  }

  logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
    _storage.deleteSecureData('token');
  }

  void dispose() => _controller.close();
}
