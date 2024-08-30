import 'package:bdo_online_clone/core/enums/navbar_enum.dart';
import 'package:flutter/material.dart';

class NavBarProvider with ChangeNotifier {
  int selectedItem = NavBarEnum.ACCOUNTS;
  int selectedContent = ContentEnum.NONE;

  Future<void> init() async {
    selectedItem = NavBarEnum.ACCOUNTS;
    selectedContent = ContentEnum.NONE;
    notifyListeners();
  }

  Future<void> setSelectedMenu(int selectedIndex) async {
    setSelectedContent(ContentEnum.NONE);
    selectedItem = selectedIndex;
    notifyListeners();
  }

  Future<void> setSelectedContent(int selectedContentIndex) async {
    selectedContent = selectedContentIndex;
    notifyListeners();
  }
}
