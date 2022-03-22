import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../components/app/logos.dart';
import '../../utils/constants/colors.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: null,
        backgroundColor: MyColors.lightPrimary,
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
