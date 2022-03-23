import 'package:flutter/material.dart';


class TextDivider extends StatelessWidget {
  final String text;
  const TextDivider({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(thickness: 0.75,)),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: FittedBox(
            child: Text(text),
          ),
        ),
        const Expanded(child: Divider(thickness: 0.75,)),
      ],
    );
  }
}
