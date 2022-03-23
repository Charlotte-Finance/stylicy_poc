part of '../login_tab.dart';

class _LoginPlatforms extends StatelessWidget {
  const _LoginPlatforms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        TextDivider(text: AppLocalizations.of(context)!.platforms_login),
        Container(
          width: size.width * 0.4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                splashRadius: 22,
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(
                  Icons.facebook,
                  size: 40,
                ),
              ),
              IconButton(
                splashRadius: 22,
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(
                  Icons.facebook,
                  size: 40,
                ),
              ),
              IconButton(
                splashRadius: 22,
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(
                  Icons.apple,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
