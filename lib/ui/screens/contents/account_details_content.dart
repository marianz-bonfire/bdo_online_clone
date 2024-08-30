import 'package:bdo_online_clone/core/common/app_color.dart';
import 'package:bdo_online_clone/data/mock_data.dart';
import 'package:bdo_online_clone/ui/widgets/selection_card.dart';
import 'package:bdo_online_clone/ui/widgets/selection_item.dart';
import 'package:flutter/material.dart';

class AccountDetailsContent extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  const AccountDetailsContent({super.key});

  @override
  State<AccountDetailsContent> createState() => _AccountDetailsContentState();
}

class _AccountDetailsContentState extends State<AccountDetailsContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.account_balance_outlined, size: 24, color: AppColor.primaryColor),
            Text(MockData.accountNickName, style: Theme.of(context).textTheme.headline6),
            Text(MockData.accountNumber, style: Theme.of(context).textTheme.bodyText1),
            Text(MockData.accountBalance, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Account Details',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SelectionCard(
              iconRight: Icons.visibility_off_outlined,
              text: 'Account Number',
              description: MockData.accountNumber,
              onTap: () {},
            ),
            const SizedBox(height: 10),
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
            SelectionItem(
              iconRight: Icons.mode_edit_outline_outlined,
              text: 'Account Nickname',
              description: MockData.accountNickName,
              onTap: () {},
            ),
            const SizedBox(height: 16),
            SelectionItem(
              text: 'Account Type',
              description: 'Savings',
              onTap: () {},
            ),
            const SizedBox(height: 16),
            SelectionItem(
              text: 'Current Balance',
              description: 'PHP ${MockData.accountBalance}',
              onTap: () {},
            ),
            const SizedBox(height: 16),
            SelectionItem(
              text: 'Date Opened',
              description: 'May 01, 2018',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
