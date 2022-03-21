import 'package:flutter/material.dart';
import 'package:poc/components/login/login_tab.dart';
import 'package:poc/components/login/register_tab.dart';
import 'package:poc/components/widgets/logos.dart';
import 'package:poc/utils/constants/strings/login_strings.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: null,
        body: Column(
          children: [
            Expanded(
              flex: 11,
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.close),
                ),
              ),
            ),
            const Expanded(flex: 13, child: Center(child: StylicyLogo())),
            Expanded(
              flex: 76,
              child: SizedBox(
                width: size.width * 0.8,
                child: const _LoginTab(),
              ),
            ),
            const Expanded(flex: 9, child: SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}

class _LoginTab extends StatefulWidget {
  const _LoginTab({Key? key}) : super(key: key);

  @override
  _LoginTabState createState() => _LoginTabState();
}

class _LoginTabState extends State<_LoginTab>
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
        SizedBox(
          width: size.width * 0.6,
          child: TabBar(
            tabs: const [
              Tab(child: Text(LoginStrings.signInTab)),
              Tab(child: Text(LoginStrings.registerTab))
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
