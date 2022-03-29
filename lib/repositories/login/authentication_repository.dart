import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();


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

  Future<void> signIn({required String email, required String password}) async {
    final User? user = (await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;
    if (user != null) {
      _storage.writeSecureData('token', 'null');
      _controller.add(AuthenticationStatus.authenticated);
    } else {
      _controller.add(AuthenticationStatus.unauthenticated);
    }
  }

  // Future<void> logIn({required String email, required String password}) async {
  //   // ToDo : real request
  //   String jsonBody = jsonEncode(<String, String>{
  //     'username': 'mor_2314',
  //     'password': '83r5^_',
  //   });
  //   final response = await HttpRequest.postRequest(
  //     endpoint: url + "login/",
  //     jsonBody: jsonBody,
  //   );
  //   _storage.writeSecureData('token', response['token']);
  //   _controller.add(AuthenticationStatus.authenticated);
  // }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<String?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  logOut() async {
    _controller.add(AuthenticationStatus.unauthenticated);
    _storage.deleteSecureData('token');
    await _googleSignIn.signOut();
    await FacebookAuth.instance.logOut();
    await _auth.signOut();
  }

  void dispose() => _controller.close();
}
