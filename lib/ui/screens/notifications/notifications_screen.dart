import 'package:bdo_online_clone/core/common/app_color.dart';
import 'package:bdo_online_clone/core/utils/navigator_context.dart';
import 'package:bdo_online_clone/ui/screens/home_screen.dart';
import 'package:bdo_online_clone/ui/screens/notifications/notification_detail_screen.dart';
import 'package:bdo_online_clone/ui/widgets/notification_item.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  static const String routeName = 'NotificationsScreen';
  const NotificationsScreen({super.key});

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final int pinLength = 6;
  String pin = "";
  bool isLoading = false;

  @override
  void initState() {
    initLoading();
    super.initState();
  }

  void addPinDigit(String digit) {
    if (pin.length < pinLength) {
      setState(() {
        pin += digit;
      });
    } else {
      //NavigatorContext.go(HomeScreen.routeName);
      goNext();
    }
  }

  void deletePinDigit() {
    if (pin.isNotEmpty) {
      setState(() {
        pin = pin.substring(0, pin.length - 1);
      });
    }
  }

  void goNext() {
    setLoading(true);
    Future.delayed(const Duration(milliseconds: 500), () {
      NavigatorContext.go(HomeScreen.routeName);
      setLoading(false);
    });
  }

  void initLoading() {
    setLoading(true);
    Future.delayed(const Duration(milliseconds: 3000), () {
      setLoading(false);
    });
  }

  void setLoading(value) {
    setState(() {
      isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
        title: const Text('Notifications'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
          onPressed: () {
            NavigatorContext.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 0,
            child: Padding(
              //padding: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NotificationItem(
                    icon: Icons.arrow_forward_outlined,
                    text: 'Change in Send Money Status',
                    description: 'Hello! Your Send Money worth PHP 2,000.00 to Bill Gates was successful.',
                    date: 'Aug 26',
                    amount: '',
                    onTap: () {
                      NavigatorContext.add(NotificationDetailScreen.routeName);
                    },
                  ),
                  NotificationItem(
                    icon: Icons.arrow_forward_outlined,
                    text: 'Change in Send Money Status',
                    description: 'Hello! Your Send Money worth PHP 3,500.00 to Bill Gates was successful.',
                    date: 'Aug 20',
                    amount: '',
                    onTap: () {
                      NavigatorContext.add(NotificationDetailScreen.routeName);
                    },
                  ),
                  NotificationItem(
                    icon: Icons.arrow_forward_outlined,
                    text: 'Change in Send Money Status',
                    description: 'Hello! Your Send Money worth PHP 10,000.00 to Steve Jobs was successful.',
                    date: 'Aug 10',
                    amount: '',
                    onTap: () {
                      NavigatorContext.add(NotificationDetailScreen.routeName);
                    },
                  ),
                  NotificationItem(
                    icon: Icons.arrow_forward_outlined,
                    text: 'Change in Send Money Status',
                    description: 'Hello! Your Send Money worth PHP 10,000.00 to Steve Jobs was successful.',
                    date: 'July 21',
                    amount: '',
                    onTap: () {
                      NavigatorContext.add(NotificationDetailScreen.routeName);
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.check_circle_outline_rounded, size: 28, color: Colors.teal),
                Text("You've reached the end of the list")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
