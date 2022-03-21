part of '../register_tab.dart';

class _RegisterConditions extends StatelessWidget {
  const _RegisterConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Text(
          LoginStrings.conditions,
          style: Theme.of(context).textTheme.bodySmall!,
          textAlign: TextAlign.justify,
        )
      ],
    );
  }
}
