import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poc/models/login/forms/formz.dart';

import '../../blocs/login/login_bloc/login_bloc.dart';
import '../../blocs/login/register_bloc/register_bloc.dart';

part 'register_tab/register_buttons.dart';
part 'register_tab/register_conditions.dart';
part 'register_tab/register_form.dart';

class RegisterTab extends StatelessWidget {
  const RegisterTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: size.width*0.1, right: size.width*0.1),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.02),
          SizedBox(
            height: size.height * 0.32,
            child: const _RegisterForm(),
          ),
          SizedBox(
            width: size.width * 0.5,
            child: const _RegisterButtons(),
          ),
          const Expanded(
              child: SizedBox.shrink(),
          ),
          const _RegisterConditions(
          ),
        ],
      ),
    );
  }
}
