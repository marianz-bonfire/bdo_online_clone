import 'package:bdo_online_clone/core/common/app_color.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final IconData? icon;
  final IconData? iconRight;
  final String text;
  final String description;
  final String date;
  final String amount;
  final VoidCallback onTap;
  const TransactionItem({
    super.key,
    this.icon,
    this.iconRight,
    required this.text,
    required this.description,
    required this.onTap,
    required this.date,
    required this.amount,
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
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  if (description.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                  const SizedBox(height: 8),
                  Text(
                    date,
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ),
            if (amount.isNotEmpty) ...[
              Text(
                amount,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
