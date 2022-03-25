part of '../login_tab.dart';

class _LoginButtons extends StatelessWidget {
  const _LoginButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _LoginButton(),
        TextButton(
          onPressed: () {
            context.read<LoginBloc>().add(const LoginSkipped());
          },
          child: Text(AppLocalizations.of(context)!.skip_login),
        ),
      ],
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.status.isValidated
              ? () {
                  context.read<LoginBloc>().add(const LoginSubmitted());
                }
              : null,
          child: SizedBox(
            width: size.width,
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.sign_in_button.toUpperCase(),
              ),
            ),
          ),
        );
      },
    );
  }
}
