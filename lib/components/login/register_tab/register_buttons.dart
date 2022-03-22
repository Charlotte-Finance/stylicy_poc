part of '../register_tab.dart';

class _RegisterButtons extends StatelessWidget {
  const _RegisterButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        OutlinedButton(
          onPressed: () {},
          child: SizedBox(
            width: size.width,
            child: Center(child: Text(AppLocalizations.of(context)!.register_button)),
          ),
        ),
      ],
    );
  }
}
