import 'package:flutter/material.dart';

import '../../utils/constants/text_styles.dart';

class TextDivider extends StatelessWidget {
  final String text;
  const TextDivider({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: FittedBox(
            child: Text(text, style: TextStyles.dividerStyle),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}
