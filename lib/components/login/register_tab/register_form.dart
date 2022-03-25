part of '../register_tab.dart';

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({Key? key}) : super(key: key);

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
      ],
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          textInputAction: TextInputAction.next,
          onChanged: (email) => context
              .read<RegisterBloc>()
              .add(RegisterEmailChanged(email: email)),
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.email_form.toUpperCase(),
            errorText: state.email.invalid ? 'invalid email' : null,
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
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.obscurePassword != current.obscurePassword ||
          previous.status != current.status,
      builder: (context, state) {
        return TextFormField(
          onFieldSubmitted: (_) {
            if (state.status.isValidated) {
              context.read<RegisterBloc>().add(const RegisterSubmitted());
            }
          },
          textInputAction: TextInputAction.done,
          obscureText: state.obscurePassword,
          onChanged: (password) => context
              .read<RegisterBloc>()
              .add(RegisterPasswordChanged(password: password)),
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: const Icon(Icons.visibility_outlined),
              onPressed: () {
                context
                    .read<RegisterBloc>()
                    .add(const RegisterPasswordVisibilityChanged());
              },
            ),
            labelText:
                AppLocalizations.of(context)!.password_form.toUpperCase(),
            errorText: state.email.invalid ? 'invalid password' : null,
          ),
        );
      },
    );
  }
}
