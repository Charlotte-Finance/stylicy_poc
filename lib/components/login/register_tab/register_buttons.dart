part of '../register_tab.dart';

class _RegisterButtons extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const _RegisterButtons({Key? key, required this.formKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.status.isValidated
              ? () {
                  if (formKey.currentState!.validate()) {
                    context.read<RegisterBloc>().add(const RegisterSubmitted());
                  }
                }
              : null,
          child: SizedBox(
            width: size.width,
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.register_button.toUpperCase(),
              ),
            ),
          ),
        );
      },
    );
  }
}
