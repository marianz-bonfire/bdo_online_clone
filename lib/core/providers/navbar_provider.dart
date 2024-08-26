import 'package:bdo_online_clone/core/enums/navbar_enum.dart';
import 'package:flutter/material.dart';

class NavBarProvider with ChangeNotifier {
  int selectedItem = NavBarEnum.ACCOUNTS;
  NavBarProvider() {
    _init();
  }

  Future<void> _init() async {}

  Future<void> setSelectedMenu(int selectedIndex) async {
    selectedItem = selectedIndex;
    notifyListeners();
  }
}
