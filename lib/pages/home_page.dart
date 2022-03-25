import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../blocs/home/navigation/navigation_cubit.dart';
import '../blocs/login/authentication_bloc/authentication_bloc.dart';
import '../components/home/designers_tab.dart';
import '../components/home/home_tab.dart';
import '../components/home/men_tab.dart';
import '../components/home/stores_tab.dart';
import '../utils/constants/nav_bar_items.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.mail_outlined),
            Icon(Icons.search),
            Text("Stylicy"),
            Icon(Icons.favorite_border),
            Icon(Icons.person_outlined),
          ],
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              context.read<AuthenticationBloc>().add(
                    AuthenticationLogoutRequested(),
                  );
            }),
      ),
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.index,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: AppLocalizations.of(context)!.home_tab,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.male),
                label: AppLocalizations.of(context)!.men_tab,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.discount_outlined),
                label: AppLocalizations.of(context)!.stores_tab,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.diamond_outlined),
                label: AppLocalizations.of(context)!.designers_tab,
              ),
            ],
            onTap: (index) {
              switch (index) {
                case 0:
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavbarItem.home);
                  break;
                case 1:
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavbarItem.men);
                  break;
                case 2:
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavbarItem.stores);
                  break;
                case 3:
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavbarItem.designers);
                  break;
              }
            },
          );
        },
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<NavigationCubit, NavigationState>(
            builder: (context, state) {
          switch (state.navbarItem) {
            case NavbarItem.home:
              return const HomeTab();
            case NavbarItem.men:
              return const MenTab();
            case NavbarItem.stores:
              return const StoresTab();
            case NavbarItem.designers:
              return const DesignersTab();
          }
        }),
      ),
    );
  }
}
