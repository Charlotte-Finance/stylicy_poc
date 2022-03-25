part of '../login_tab.dart';

class _LoginPlatforms extends StatelessWidget {
  const _LoginPlatforms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        TextDivider(text: AppLocalizations.of(context)!.platforms_login),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: size.width * 0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                splashRadius: 22,
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(
                    'assets/logos/google.png',
                  ),
                ),
              ),
              IconButton(
                splashRadius: 22,
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: SizedBox(
                  child: Image.asset(
                    'assets/logos/facebook.png',
                    height: 35,
                    width: 35,
                  ),
                ),
              ),
              IconButton(
                splashRadius: 22,
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: SizedBox(
                  child: Image.asset(
                    'assets/logos/apple.png',
                    height: 35,
                    width: 35,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
