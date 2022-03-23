part of '../register_tab.dart';

class _RegisterButtons extends StatelessWidget {
  const _RegisterButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        AppLocalizations.of(context)!.register_button.toUpperCase(),
      ),
    );
  }
}
