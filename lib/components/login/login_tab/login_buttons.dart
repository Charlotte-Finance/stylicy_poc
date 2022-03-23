part of '../login_tab.dart';

class _LoginButtons extends StatelessWidget {
  const _LoginButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: SizedBox(
            width: size.width,
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.sign_in_button.toUpperCase(),
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(AppLocalizations.of(context)!.skip_login),
        ),
      ],
    );
  }
}
