import 'package:bdo_online_clone/core/common/app_color.dart';
import 'package:flutter/material.dart';

class SelectionCard extends StatelessWidget {
  final IconData? icon;
  final IconData? iconRight;
  final String text;
  final String description;
  final VoidCallback onTap;
  const SelectionCard({
    super.key,
    this.icon,
    this.iconRight,
    required this.text,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          description,
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  if (iconRight != null) ...[
                    const SizedBox(width: 16),
                    Icon(iconRight, size: 28, color: AppColor.primaryColor),
                  ] else ...[
                    Container(),
                  ]
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
