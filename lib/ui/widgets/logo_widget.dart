
import 'package:bdo_online_clone/core/common/app_color.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo.png', // Replace with your logo asset path
            height: 40,
          ),
          const SizedBox(width: 10),
          const Text(
            'online',
            style: TextStyle(
              color: AppColor.primaryDarkerColor,
              fontSize: 40,
            ),
          )
        ],
      ),
    );
  }
}