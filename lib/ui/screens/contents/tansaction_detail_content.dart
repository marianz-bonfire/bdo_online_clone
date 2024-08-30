import 'package:bdo_online_clone/core/common/app_color.dart';
import 'package:bdo_online_clone/data/mock_data.dart';
import 'package:bdo_online_clone/ui/widgets/selection_card.dart';
import 'package:bdo_online_clone/ui/widgets/selection_item.dart';
import 'package:bdo_online_clone/ui/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionDetailsContent extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  const TransactionDetailsContent({super.key});

  @override
  State<TransactionDetailsContent> createState() => _TransactionDetailsContentState();
}

class _TransactionDetailsContentState extends State<TransactionDetailsContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.arrow_forward_outlined, size: 24, color: AppColor.primaryColor),
            Text(MockData.accountNickName),
            const Text('-PHP 5,000.10', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text(
              'Aug 16, 2024',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            buildAccountCard(),
            // Account details section
          ],
        ),
      ),
    );
  }

  Widget buildAccountCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Padding(
        //padding: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TransactionItem(
              text: 'Bank Name',
              description: 'Union Bank Of The Philippines',
              date: '' ,
              amount: '',
              onTap: () {},
            ),
            TransactionItem(
              text: 'Reference Number',
              description: '0842342473000232',
              date: '' ,
              amount: '',
              onTap: () {},
            ),
            TransactionItem(
              text: 'Invoice Number',
              description: '5799204s',
              date: '' ,
              amount: '',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
