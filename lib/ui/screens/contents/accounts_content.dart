import 'package:bdo_online_clone/core/common/app_color.dart';
import 'package:flutter/material.dart';

class AccountsContent extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  const AccountsContent({super.key});

  @override
  State<AccountsContent> createState() => _AccountsContentState();
}

class _AccountsContentState extends State<AccountsContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Savings Accounts',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          buildAccountCard(
            icon: Icons.account_balance_outlined,
            accountName: 'Marianz',
            accountNumber: '****4714',
            availableBalance: '3,056,624.10',
            currentBalance: '3,056,624.10',
            onTap: () {},
          ),
          const SizedBox(height: 20),
          const Text(
            'Credit Cards',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          buildCreditCard(),
        ],
      ),
    );
  }

  Widget buildAccountCard({
    required IconData icon,
    required String accountName,
    required String accountNumber,
    required String availableBalance,
    required String currentBalance,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 32, color: AppColor.primaryColor),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      accountName,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      accountNumber,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Text(
                          'Available Balance:',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        const Spacer(),
                        Text(
                          'PHP $availableBalance',
                          style: const TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Current Balance:',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        const Spacer(),
                        Text(
                          'PHP $currentBalance',
                          style: const TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCreditCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.credit_card_outlined, size: 32, color: AppColor.primaryColor),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'VISA CLASSIC',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '****0703',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle activate card action
              },
              style: ElevatedButton.styleFrom(
                primary: AppColor.primaryColor, // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Center(child: Text('Activate Card')),
            ),
          ],
        ),
      ),
    );
  }
}
