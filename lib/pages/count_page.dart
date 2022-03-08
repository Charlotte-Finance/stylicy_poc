import 'package:flutter/material.dart';
import 'package:poc/components/count/counter_buttons.dart';
import 'package:poc/components/count/products_button.dart';
import 'package:poc/components/count/user_information.dart';



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
