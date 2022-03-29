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
              const _Google(),
              const _Facebook(),
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

class _Facebook extends StatelessWidget {
  const _Facebook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FacebookBloc, FacebookState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return IconButton(
          splashRadius: 22,
          padding: EdgeInsets.zero,
          onPressed: () async {
            context.read<FacebookBloc>().add(const FacebookLoginRequested());
          },
          icon: SizedBox(
            child: Image.asset(
              'assets/logos/facebook.png',
              height: 35,
              width: 35,
            ),
          ),
        );
      },
    );
  }
}

class _Google extends StatelessWidget {
  const _Google({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleBloc, GoogleState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return  IconButton(
          splashRadius: 22,
          padding: EdgeInsets.zero,
          onPressed: () async {
            context.read<GoogleBloc>().add(const GoogleLoginRequested());
          },
          icon: SizedBox(
            height: 50,
            width: 50,
            child: Image.asset(
              'assets/logos/google.png',
            ),
          ),
        );
      },
    );
  }
}
