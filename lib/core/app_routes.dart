import 'package:bdo_online_clone/ui/screens/sendmoney/bank_selections_screen.dart';
import 'package:bdo_online_clone/ui/screens/sendmoney/confirm_detail_screen.dart';
import 'package:bdo_online_clone/ui/screens/home_screen.dart';
import 'package:bdo_online_clone/ui/screens/more/manage_cards_screen.dart';
import 'package:bdo_online_clone/ui/screens/more/add_remove_account_screen.dart';
import 'package:bdo_online_clone/ui/screens/more/manage_account_screen.dart';
import 'package:bdo_online_clone/ui/screens/more/manage_login_screen.dart';
import 'package:bdo_online_clone/ui/screens/more/show_hide_account_screen.dart';
import 'package:bdo_online_clone/ui/screens/more/update_profile_screen.dart';
import 'package:bdo_online_clone/ui/screens/notifications/notification_detail_screen.dart';
import 'package:bdo_online_clone/ui/screens/notifications/notifications_screen.dart';
import 'package:bdo_online_clone/ui/screens/sendmoney/other_bank_wallets_screen.dart';
import 'package:bdo_online_clone/ui/screens/passcode_screen.dart';
import 'package:bdo_online_clone/ui/screens/sendmoney/sendmoney_favorites_screen.dart';
import 'package:bdo_online_clone/ui/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    HomeScreen.routeName: (context) => HomeScreen(),
    WelcomeScreen.routeName: (context) => WelcomeScreen(),
    PasscodeScreen.routeName: (context) => PasscodeScreen(),
    NotificationsScreen.routeName: (context) => NotificationsScreen(),
    NotificationDetailScreen.routeName: (context) => NotificationDetailScreen(),
    ConfirmDetailsScreen.routeName: (context) => ConfirmDetailsScreen(),
    OtherBanksAndWalletsScreen.routeName: (context) => OtherBanksAndWalletsScreen(),
    ManageCardsScreen.routeName: (context) => ManageCardsScreen(),
    BankSelectionScreen.routeName: (context) => BankSelectionScreen(),
    ManageAccountScreen.routeName: (context) => ManageAccountScreen(),
    AddRemoveAccountScreen.routeName: (context) => AddRemoveAccountScreen(),
    ShowHideAccountScreen.routeName: (context) => ShowHideAccountScreen(),
    UpdateProfileScreen.routeName: (context) => UpdateProfileScreen(),
    ManageLoginScreen.routeName: (context) => ManageLoginScreen(),
    SendMoneyFavoritesScreen.routeName: (context) => SendMoneyFavoritesScreen(),
  };
}
