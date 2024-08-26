import 'package:bdo_online_clone/core/common/app_color.dart';
import 'package:bdo_online_clone/ui/widgets/selection_card.dart';
import 'package:flutter/material.dart';

class QrContent extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  const QrContent({super.key});

  @override
  State<QrContent> createState() => _QrContentState();
}

class _QrContentState extends State<QrContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          SelectionCard(
            icon: Icons.send_outlined,
            text: 'Send Money',
            description: 'Upload or scan a QR code to Send Money to anyone',
            onTap: () {},
          ),
          const SizedBox(height: 10),
          SelectionCard(
            icon: Icons.clean_hands_outlined,
            text: 'Request Money',
            description: 'Generate a QR code to Request Money from anyone',
            onTap: () {},
          ),
          const SizedBox(height: 10),
          SelectionCard(
            icon: Icons.print_disabled_outlined,
            text: 'Withdraw Money',
            description: 'Generate a QR code to withdraw from any QR-enabled BDO ATM',
            onTap: () {},
          ),
          const SizedBox(height: 10),
          SelectionCard(
            icon: Icons.money,
            text: 'Deposit Money',
            description: 'Generate a QR ode to deposit via any BDO Cash Deposit Machine',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
