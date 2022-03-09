import 'dart:async';
import 'dart:convert';
import 'package:poc/utils/http/http_request.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final String url = "/auth/";

  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn(String username, String password) async {
    String jsonBody = jsonEncode(<String, String>{
      'username': 'mor_2314',
      'password': '83r5^_',
    });
    final response = await HttpRequest.postRequest(
      endpoint: url + "login/",
      jsonBody: jsonBody,
    );
    await Future.delayed(
      const Duration(milliseconds: 300),
      () => _controller.add(AuthenticationStatus.authenticated),
    );
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
