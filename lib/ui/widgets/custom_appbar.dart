import 'package:flutter/material.dart';

import 'package:bdo_online_clone/core/common/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? backIcon;
  final Color? backgroundColor;

  CustomAppBar({
    required this.title,
    this.backIcon,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: backgroundColor ?? AppColor.primaryColor,
      leading: IconButton(
        icon: Icon(backIcon),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
