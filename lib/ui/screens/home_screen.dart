import 'package:bdo_online_clone/core/common/app_color.dart';
import 'package:bdo_online_clone/core/enums/navbar_enum.dart';
import 'package:bdo_online_clone/core/providers/navbar_provider.dart';
import 'package:bdo_online_clone/ui/screens/contents/accounts_content.dart';
import 'package:bdo_online_clone/ui/screens/contents/more_content.dart';
import 'package:bdo_online_clone/ui/screens/contents/pay_content.dart';
import 'package:bdo_online_clone/ui/screens/contents/qr_content.dart';
import 'package:bdo_online_clone/ui/screens/contents/sendmoney_content.dart';
import 'package:bdo_online_clone/ui/widgets/circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  @override
  void initState() {
    initLoading();
    super.initState();
  }

  void setLoading(value) {
    setState(() {
      isLoading = value;
    });
  }

  void initLoading() {
    setLoading(true);
    Future.delayed(const Duration(milliseconds: 3000), () {
      setLoading(false);
    });
  }

  Widget content(selectedIndex) {
    if (selectedIndex == NavBarEnum.ACCOUNTS) {
      return AccountsContent();
    } else if (selectedIndex == NavBarEnum.SEND_MONEY) {
      return SendMoneyContent();
    } else if (selectedIndex == NavBarEnum.PAY) {
      return PayContent();
    } else if (selectedIndex == NavBarEnum.QR) {
      return QrContent();
    } else if (selectedIndex == NavBarEnum.MORE) {
      return MoreContent();
    } else {
      return Container();
    }
  }

  String appTitle(selectedIndex) {
    if (selectedIndex == NavBarEnum.ACCOUNTS) {
      return 'Accounts';
    } else if (selectedIndex == NavBarEnum.SEND_MONEY) {
      return 'Send Money';
    } else if (selectedIndex == NavBarEnum.PAY) {
      return 'Pay';
    } else if (selectedIndex == NavBarEnum.QR) {
      return 'QR Transactions';
    } else if (selectedIndex == NavBarEnum.MORE) {
      return 'More';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavBarProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          elevation: 0,
          title: Text(appTitle(provider.selectedItem)),
          actions: [
            Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications, color: Colors.white),
                  onPressed: () {
                    // Handle notifications action
                  },
                ),
                Positioned(
                  right: 12,
                  top: 12,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: isLoading
            ? const CircularProgress()
            : SingleChildScrollView(
                child: content(provider.selectedItem),
              ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accounts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.send),
              label: 'Send Money',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payment),
              label: 'Pay',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              label: 'QR',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'More',
            ),
          ],
          selectedItemColor: AppColor.primaryColor,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          showUnselectedLabels: true,
          onTap: (index) {
            provider.setSelectedMenu(index);
          },
          currentIndex: provider.selectedItem,
        ),
      );
    });
  }
}
