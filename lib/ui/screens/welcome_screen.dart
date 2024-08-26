import 'package:bdo_online_clone/core/common/app_color.dart';
import 'package:bdo_online_clone/core/utils/navigator_context.dart';
import 'package:bdo_online_clone/ui/screens/passcode_screen.dart';
import 'package:bdo_online_clone/ui/widgets/feature_button.dart';
import 'package:bdo_online_clone/ui/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String routeName = 'WelcomeScreen';
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height * 0.40;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
        // Title widget removed for simplicity as the logo is placed in the body
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 100), // Top padding
              const LogoWidget(),
              SizedBox(height: _height),
              const Text(
                'Ver 1.13.0',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      NavigatorContext.go(PasscodeScreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded corners
                      ),
                    ),
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FeatureButton(
                  icon: Icons.home_outlined, // Use appropriate icons
                  label: 'Open an Account',
                  onTap: () {
                    // Handle tap
                  },
                ),
                FeatureButton(
                  icon: Icons.credit_card,
                  label: 'Get a Credit Card',
                  onTap: () {
                    // Handle tap
                  },
                ),
                FeatureButton(
                  icon: Icons.check_circle_outline,
                  label: 'Activate Credit Card',
                  onTap: () {
                    // Handle tap
                  },
                ),
                FeatureButton(
                  icon: Icons.spa_outlined,
                  label: 'Manage Investments',
                  onTap: () {
                    // Handle tap
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      /*
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
      ),

       */
    );
  }
}
