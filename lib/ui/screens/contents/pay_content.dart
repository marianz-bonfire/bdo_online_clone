import 'package:bdo_online_clone/core/common/app_color.dart';
import 'package:bdo_online_clone/ui/widgets/selection_card.dart';
import 'package:flutter/material.dart';

class PayContent extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  const PayContent({super.key});

  @override
  State<PayContent> createState() => _PayContentState();
}

class _PayContentState extends State<PayContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          SelectionCard(
            icon: Icons.receipt,
            text: 'Pay Bills',
            description: 'Make a payment to a biller',
            onTap: () {},
          ),
          const SizedBox(height: 10),
          SelectionCard(
            icon: Icons.mobile_friendly,
            text: 'Buy Load',
            description: 'Send prepaid load to a mobile number',
            onTap: () {},
          ),
          const SizedBox(height: 10),
          SelectionCard(
            icon: Icons.calendar_month,
            text: 'View Scheduled',
            description: 'View and manage your scheduled transactions',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
