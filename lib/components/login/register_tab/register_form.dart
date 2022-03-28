part of '../register_tab.dart';

class _RegisterForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const _RegisterForm({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: _EmailInput(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: _PasswordInput(formKey:formKey),
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
        return TextFormField(
          textInputAction: TextInputAction.next,
          onChanged: (email) => context
              .read<RegisterBloc>()
              .add(RegisterEmailChanged(email: email)),
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.email_form.toUpperCase(),
          ),
          validator: (email) {
            return EmailValidator.validate(email!) ? null : AppLocalizations.of(context)!.invalid_email;
          },
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const _PasswordInput({required this.formKey});

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
            if (state.status.isValidated && formKey.currentState!.validate()) {
              context.read<RegisterBloc>().add(const RegisterSubmitted());
            }
          },
          textInputAction: TextInputAction.done,
          obscureText: state.obscurePassword,
          onChanged: (password) => context
              .read<RegisterBloc>()
              .add(RegisterPasswordChanged(password: password)),
          validator: (password) {
            return password!.length >= 8
                ? null
                : AppLocalizations.of(context)!.invalid_password;
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(state.obscurePassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined),
              onPressed: () {
                context
                    .read<RegisterBloc>()
                    .add(const RegisterPasswordVisibilityChanged());
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

