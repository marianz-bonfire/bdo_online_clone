import 'package:bdo_online_clone/core/common/app_color.dart';
import 'package:bdo_online_clone/core/utils/navigator_context.dart';
import 'package:bdo_online_clone/ui/screens/more/add_remove_account_screen.dart';
import 'package:bdo_online_clone/ui/screens/more/show_hide_account_screen.dart';
import 'package:bdo_online_clone/ui/widgets/selection_card.dart';
import 'package:flutter/material.dart';

class ManageLoginScreen extends StatefulWidget {
  static const String routeName = 'ManageLoginScreen';

  const ManageLoginScreen({super.key});

  @override
  State<ManageLoginScreen> createState() => _ManageLoginScreenState();
}

class _ManageLoginScreenState extends State<ManageLoginScreen> {
  bool _switchValue = true;
  void onChangePin() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text('Manage Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text(
                      '6-Digit PIN',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: AppColor.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Rounded corners
                        ),
                      ),
                      child: const Text(
                        'Change PIN',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Text(
                      'Biometrics',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Switch(
                      value: _switchValue,
                      onChanged: (value) {
                        setState(() {
                          _switchValue = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
