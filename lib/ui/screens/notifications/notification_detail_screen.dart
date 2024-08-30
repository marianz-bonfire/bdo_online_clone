import 'package:bdo_online_clone/core/common/app_color.dart';
import 'package:bdo_online_clone/core/enums/navbar_enum.dart';
import 'package:bdo_online_clone/core/providers/navbar_provider.dart';
import 'package:bdo_online_clone/core/utils/dialogs.dart';
import 'package:bdo_online_clone/core/utils/navigator_context.dart';
import 'package:bdo_online_clone/data/mock_data.dart';
import 'package:bdo_online_clone/ui/screens/home_screen.dart';
import 'package:bdo_online_clone/ui/widgets/circular_progress.dart';
import 'package:bdo_online_clone/ui/widgets/dash_separator.dart';
import 'package:bdo_online_clone/ui/widgets/dashline.dart';
import 'package:bdo_online_clone/ui/widgets/logo_widget.dart';
import 'package:bdo_online_clone/ui/widgets/notification_item.dart';
import 'package:bdo_online_clone/ui/widgets/number_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationDetailScreen extends StatefulWidget {
  static const String routeName = 'NotificationDetailScreen';
  const NotificationDetailScreen({super.key});

  @override
  _NotificationDetailScreenState createState() => _NotificationDetailScreenState();
}

class _NotificationDetailScreenState extends State<NotificationDetailScreen> {
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
          const SizedBox(height: 16),
          const Icon(Icons.check_circle, size: 50, color: Colors.teal),
          const Text(
            'Sent!',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.teal),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('PHP ', style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal)),
              Text('624.10', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text('To'),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Bill Gates',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('G-Xchange Inc./GCASH 021930122'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Expanded(
                        flex: 1,
                        child: Text('From'),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '${MockData.accountNickName} ${MockData.accountNumber}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const DashSeparator(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        flex: 1,
                        child: Text('Send on'),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'August 24, 2024',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const DashSeparator(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        flex: 1,
                        child: Text('Amount'),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'PHP 2,000.00',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        flex: 1,
                        child: Text('Service Fee'),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'PHP 10.00',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const DashSeparator(),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Reference no.'),
                        Text(
                          'BN-20240826-55808237',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Text('Invoice no.'),
                        Text(
                          '34578',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Spacer(),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    //
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.file_download_outlined, size: 28, color: AppColor.primaryColor),
                      Text(
                        'Save Image',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.share, size: 28, color: AppColor.primaryColor),
                      Text(
                        'Share',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
