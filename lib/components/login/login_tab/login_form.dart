part of '../login_tab.dart';

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: _EmailInput(),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: _PasswordInput(),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: _ForgotPassword(),
        ),
      ],
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          textInputAction: TextInputAction.next,
          onChanged: (email) =>
              context.read<LoginBloc>().add(LoginEmailChanged(email: email)),
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.alternate_email_outlined),
            labelText: AppLocalizations.of(context)!.email_form.toUpperCase(),
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.status != current.status ||
          previous.obscurePassword != current.obscurePassword,
      builder: (context, state) {
        return TextFormField(
          onFieldSubmitted: (_) {
            if (state.status.isValidated) {
              context.read<LoginBloc>().add(const LoginSubmitted());
            }
          },
          textInputAction: TextInputAction.done,
          obscureText: state.obscurePassword,
          onChanged: (password) => context
              .read<LoginBloc>()
              .add(LoginPasswordChanged(password: password)),
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(state.obscurePassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined),
              onPressed: () {
                context
                    .read<LoginBloc>()
                    .add(const LoginPasswordVisibilityChanged());
              },

            ),
            labelText:
                AppLocalizations.of(context)!.password_form.toUpperCase(),
          ),
        );
      },
    );
  }
}

class _ForgotPassword extends StatelessWidget {
  const _ForgotPassword();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<ForgotPasswordBloc>().add(const ForgotPasswordRequested());
        showModalBottomSheet(
            enableDrag: false,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            context: context,
            builder: (builder) {
              return const ResetPasswordForm();
            });
      },
      child: Text(
        AppLocalizations.of(context)!.forget_pwd_button,
      ),
    );
  }
}
