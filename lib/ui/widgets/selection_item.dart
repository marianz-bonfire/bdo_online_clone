import 'package:bdo_online_clone/core/common/app_color.dart';
import 'package:flutter/material.dart';

class SelectionItem extends StatelessWidget {
  final IconData? icon;
  final IconData? iconRight;
  final Color? iconRightColor;
  final String text;
  final String description;
  final VoidCallback onTap;
  const SelectionItem({
    super.key,
    this.icon,
    this.iconRight,
    this.iconRightColor,
    required this.text,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, size: 28, color: AppColor.primaryColor),
              const SizedBox(width: 16),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            if (iconRight != null) ...[
              const SizedBox(width: 16),
              Icon(iconRight, size: 26, color: iconRightColor ?? AppColor.primaryColor),
            ]
          ],
        ),
      ),
    );
  }
}
