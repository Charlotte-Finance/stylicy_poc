part of '../login_tab.dart';

class _LoginPlatforms extends StatelessWidget {
  const _LoginPlatforms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextDivider(text: LoginStrings.platformsLogin),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.facebook)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.facebook)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.apple)),
          ],
        ),
      ],
    );
  }
}
