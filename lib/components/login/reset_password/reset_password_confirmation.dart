import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../blocs/login/reset_password_bloc/forgot_password_bloc.dart';
import '../../../models/login/forms/formz.dart';
import '../../app/loading_indicator.dart';

class ResetPasswordConfirmation extends StatelessWidget {
  const ResetPasswordConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
            buildWhen: (previous, current) => previous.status != current.status,
            builder: (context, state) {
              switch (state.status) {
                case FormzStatus.submissionSuccess:
                  return const _SubmissionSuccess();
                case FormzStatus.submissionFailure:
                  // TODO: Handle this case.
                  break;
                default:
              }
              return SizedBox(
                  height: size.height * 0.5, child: MyLoadingIndicator());
            }),
        Positioned(
          top: -50,
          child: CircleAvatar(
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            backgroundColor: Theme.of(context).colorScheme.primary,
            radius: 50,
            child: const Icon(
              Icons.outgoing_mail,
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}

class _SubmissionSuccess extends StatelessWidget {
  const _SubmissionSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(AppLocalizations.of(context)!.reset_mail_sent),
          const SizedBox(height: 5),
          Center(
            child: Text(
              AppLocalizations.of(context)!.reset_mail_instructions,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: SizedBox(
              width: size.width * 0.4,
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.close_reset.toUpperCase(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
