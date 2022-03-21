part of '../login_tab.dart';

class _LoginButtons extends StatelessWidget {
  const _LoginButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        OutlinedButton(
          onPressed: () {},
          child: SizedBox(
            width: size.width,
            child: const Center(child: Text(LoginStrings.signInAction)),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(LoginStrings.skipLogin),
        ),
      ],
    );
  }
}
