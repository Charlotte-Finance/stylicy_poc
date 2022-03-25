import 'package:flutter/material.dart';

import '../components/app/logos.dart';


class SplashPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashPage());
  }

  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: null,
        body: Column(
          children: [
            SizedBox(height: size.height / 3),
            const Center(child: StylicyLogo()),
          ],
        ),
      ),
    );
  }
}
