import 'package:flutter/material.dart';

import '../components/login/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          automaticallyImplyLeading: false,
        ),
        body: const Padding(
          padding: EdgeInsets.all(12),
          child: LoginForm(),
        ),
      ),
    );
  }
}
