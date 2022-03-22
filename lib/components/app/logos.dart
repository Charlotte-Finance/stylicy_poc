
import 'package:flutter/material.dart';


class StylicyLogo extends StatelessWidget {
  const StylicyLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ToDo : Replace by Logo
    return Text(
      "Stylicy",
      style: Theme.of(context).textTheme.displayMedium!
    );
  }
}
