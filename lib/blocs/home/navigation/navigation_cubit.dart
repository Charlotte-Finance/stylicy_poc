import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../utils/constants/nav_bar_items.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(NavbarItem.home, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(const NavigationState(NavbarItem.home, 0));
        break;
      case NavbarItem.men:
        emit(const NavigationState(NavbarItem.men, 1));
        break;
      case NavbarItem.stores:
        emit(const NavigationState(NavbarItem.stores, 2));
        break;
      case NavbarItem.designers:
        emit(const NavigationState(NavbarItem.designers, 3));
        break;
    }
  }
}