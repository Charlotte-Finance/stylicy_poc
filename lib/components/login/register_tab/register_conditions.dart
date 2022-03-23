part of '../register_tab.dart';

class _RegisterConditions extends StatelessWidget {
  const _RegisterConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Divider(),
        AutoSizeText(
          AppLocalizations.of(context)!.register_conditions,
          maxLines: 5,
        ),
      ],
    );
  }
}
