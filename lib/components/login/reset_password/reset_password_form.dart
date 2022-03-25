import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poc/models/login/forms/formz.dart';

import '../../../blocs/login/reset_password_bloc/forgot_password_bloc.dart';
import 'reset_password_confirmation.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(AppLocalizations.of(context)!.reset_pwd),
              const SizedBox(height: 5),
              Center(
                child: Text(
                  AppLocalizations.of(context)!.reset_pwd_instructions,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    left: 25,
                    right: 25),
                child: const _EmailInput(),
              ),
              const SizedBox(height: 30),
              const _ResetButton(),
              const SizedBox(height: 10),
            ],
          ),
        ),
        Positioned(
          top: -50,
          child: CircleAvatar(
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            backgroundColor: Theme.of(context).colorScheme.primary,
            radius: 50,
            child: const Icon(
              Icons.email_outlined,
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          onFieldSubmitted: (_) {
            if (state.status.isValidated) {
              context.read<ForgotPasswordBloc>().add(const ResetEmailSent());
              Navigator.pop(context);
              showModalBottomSheet(
                enableDrag: false,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                context: context,
                builder: (builder) {
                  return const ResetPasswordConfirmation();
                },
              );
            }
          },
          textInputAction: TextInputAction.done,
          onChanged: (email) => context
              .read<ForgotPasswordBloc>()
              .add(ResetPasswordEmailChanged(email: email)),
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.email_form.toUpperCase(),
            errorText: state.email.invalid ? 'invalid email' : null,
          ),
        );
      },
    );
  }
}

class _ResetButton extends StatelessWidget {
  const _ResetButton();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.status.isValidated
              ? () {
            context.read<ForgotPasswordBloc>().add(const ResetEmailSent());
            Navigator.pop(context);
            showModalBottomSheet(
                enableDrag: false,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                context: context,
                builder: (builder) {
                  return const ResetPasswordConfirmation();
                });
          }
              : null,
          child: SizedBox(
            width: size.width * 0.4,
            child: Center(
              child: Text(
                AppLocalizations.of(context)!
                    .reset_pwd_button
                    .toUpperCase(),
              ),
            ),
          ),
        );
      },
    );
  }
}

