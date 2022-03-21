import 'package:flutter/material.dart';
import 'package:poc/utils/constants/strings/login_strings.dart';


part 'register_tab/register_form.dart';
part 'register_tab/register_buttons.dart';
part 'register_tab/register_conditions.dart';

class RegisterTab extends StatelessWidget {
  const RegisterTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox.shrink(),

        const _RegisterForm(),
        SizedBox(width: size.width * 0.5, child: const _RegisterButtons()),
        const _RegisterConditions()
      ],
    );
  }
}
