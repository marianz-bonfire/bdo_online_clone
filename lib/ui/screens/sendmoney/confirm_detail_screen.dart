import 'package:bdo_online_clone/core/common/app_color.dart';
import 'package:bdo_online_clone/data/mock_data.dart';
import 'package:bdo_online_clone/ui/widgets/dash_separator.dart';
import 'package:flutter/material.dart';

class ConfirmDetailsScreen extends StatelessWidget {
  static const String routeName = 'ConfirmDetailsScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text('Confirm details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total amount to be deducted',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'PHP 1,610.00',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const DashSeparator(),
                    buildAmountRow('Send Money Amount', 'PHP 1,600.00'),
                    buildAmountRow('Service Fee', 'PHP 10.00'),
                    const DashSeparator(),
                    buildTransferDetail(
                      icon: Icons.account_balance_outlined,
                      title: 'From ${MockData.accountNickName}',
                      accountDetails: MockData.accountNumber,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(Icons.arrow_downward_outlined, size: 30, color: Colors.grey),
                    ),
                    buildTransferDetail(
                      icon: Icons.wallet_outlined,
                      title: 'To Bil Gates',
                      accountDetails: 'G-Xchange, Inc. / GCash\n0931422320',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            buildReminderCard(),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle send action
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Send', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAmountRow(String title, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          Text(amount, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget buildTransferDetail({required IconData icon, required String title, required String accountDetails}) {
    return Row(
      children: [
        Icon(icon, size: 40, color: Colors.blue),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(accountDetails, style: const TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildReminderCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: const Color(0xFFE0F2F1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.info, color: AppColor.primaryColor),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Important Reminders:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '1. Scheduled transactions previously set on the old app will still be debited. Check and cancel existing transactions to avoid double debit.',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '2. Processing of scheduled transactions will follow Philippine date and time.',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}