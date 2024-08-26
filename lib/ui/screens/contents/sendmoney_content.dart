import 'package:bdo_online_clone/core/common/app_color.dart';
import 'package:bdo_online_clone/ui/widgets/selection_card.dart';
import 'package:flutter/material.dart';

class SendMoneyContent extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  const SendMoneyContent({super.key});

  @override
  State<SendMoneyContent> createState() => _SendMoneyContentState();
}

class _SendMoneyContentState extends State<SendMoneyContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          SelectionCard(
            icon: Icons.send,
            text: 'Own Account',
            description: 'Send Money to your own account',
            onTap: () {},
          ),
          const SizedBox(height: 10),
          SelectionCard(
            icon: Icons.card_giftcard_sharp,
            text: 'Any BDO Account',
            description: 'Send Money to other BDO accounts',
            onTap: () {},
          ),
          const SizedBox(height: 10),
          SelectionCard(
            icon: Icons.wallet,
            text: 'Other Banks and Wallets',
            description: 'Send Money to another bank or wallet',
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
