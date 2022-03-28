import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poc/models/login/forms/formz.dart';

import '../blocs/login/login_bloc/login_bloc.dart';
import '../blocs/login/register_bloc/register_bloc.dart';
import '../components/app/loading_indicator.dart';
import '../components/app/logos.dart';
import '../components/login/login_tab.dart';
import '../components/login/register_tab.dart';

class LoginPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: null,
          body: SingleChildScrollView(
            child: Column(
              children: [
                _SkipIcon(),
                SizedBox(
                  height: size.height * 0.13,
                  child: const Center(
                    child: StylicyLogo(),
                  ),
                ),
                _Content(),
                SizedBox(height: size.height * 0.06)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SkipIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, loginState) {
        return BlocBuilder<RegisterBloc, RegisterState>(
          buildWhen: (previous, current) => previous.status != current.status,
          builder: (context, registerState) {
            bool isLoading = loginState.status.isSubmissionInProgress ||
                loginState.status.isSubmissionSuccess ||
                registerState.status.isSubmissionInProgress ||
                registerState.status.isSubmissionSuccess;
            return SizedBox(
              height: size.height * 0.11,
              child: Align(
                alignment: Alignment.bottomRight,
                child: isLoading
                    ? const SizedBox.shrink()
                    : IconButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(const LoginSkipped());
                        },
                        icon: const Icon(Icons.close),
                      ),
              ),
            );
          },
        );
      },
    );
  }
}

class _Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, loginState) {
        return BlocBuilder<RegisterBloc, RegisterState>(
          buildWhen: (previous, current) => previous.status != current.status,
          builder: (context, registerState) {
            bool isLoading = loginState.status.isSubmissionInProgress ||
                loginState.status.isSubmissionSuccess ||
                registerState.status.isSubmissionInProgress ||
                registerState.status.isSubmissionSuccess;
            return SizedBox(
                height: size.height * 0.70,
                child: isLoading ? const MyLoadingIndicator() : __Content());
          },
        );
      },
    );
  }
}

class __Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.2,
              right: size.width * 0.2,
            ),
            child: TabBar(
              tabs: [
                Tab(
                  child: FittedBox(
                      child: Text(AppLocalizations.of(context)!.sign_in_tab)),
                ),
                Tab(
                  child: FittedBox(
                      child: Text(AppLocalizations.of(context)!.register_tab)),
                ),
              ],
              indicatorSize: TabBarIndicatorSize.label,
            ),
          ),
          const Expanded(
            child: TabBarView(
              physics: BouncingScrollPhysics(),
              children: [LoginTab(), RegisterTab()],
            ),
          ),
        ],
      ),
    );
  }
}
