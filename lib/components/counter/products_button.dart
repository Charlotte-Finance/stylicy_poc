import 'package:flutter/material.dart';

import '../../utils/routes/constants.dart';


class ProductsButton extends StatelessWidget {
  const ProductsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("Show products"),
      onPressed: () => Navigator.pushNamed(
        context,
        productRoute,
      ),
    );
  }
}
