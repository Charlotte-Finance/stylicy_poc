import 'package:flutter/material.dart';

import '../../components/counter/counter_buttons.dart';
import '../../components/counter/products_button.dart';
import '../../components/counter/user_information.dart';



class CountPage extends StatelessWidget {
  const CountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const <Widget>[
              UserInformation(),
              ProductsButton(),
              CounterButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
