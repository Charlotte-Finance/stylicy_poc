import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../components/app/logos.dart';
import '../../components/login/login_tab.dart';
import '../../components/login/register_tab.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: null,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.11,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.close),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.13,
                child: const Center(child: StylicyLogo()),
              ),
              SizedBox(
                height: size.height * 0.74,
                child: const _PageContent(),
              ),
              SizedBox(
                height: size.height * 0.02,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _PageContent extends StatefulWidget {
  const _PageContent({Key? key}) : super(key: key);

  @override
  _PageContentState createState() => _PageContentState();
}

class _PageContentState extends State<_PageContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
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
                  child: Text(AppLocalizations.of(context)!.sign_in_tab),
                ),
              ),
              Tab(
                child: FittedBox(
                  child: Text(AppLocalizations.of(context)!.register_tab),
                ),
              ),
            ],
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.label,
          ),
        ),
        Expanded(
          child: TabBarView(
            physics: const BouncingScrollPhysics(),
            children: const [Center(child: LoginTab()), RegisterTab()],
            controller: _tabController,
          ),
        ),
      ],
    );
  }
}
