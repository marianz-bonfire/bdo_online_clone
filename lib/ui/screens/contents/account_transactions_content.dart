import 'package:bdo_online_clone/core/common/app_color.dart';
import 'package:bdo_online_clone/core/enums/navbar_enum.dart';
import 'package:bdo_online_clone/core/providers/navbar_provider.dart';
import 'package:bdo_online_clone/data/mock_data.dart';
import 'package:bdo_online_clone/ui/widgets/selection_card.dart';
import 'package:bdo_online_clone/ui/widgets/selection_item.dart';
import 'package:bdo_online_clone/ui/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountTransactionsContent extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  const AccountTransactionsContent({super.key});

  @override
  State<AccountTransactionsContent> createState() => _AccountTransactionsContentState();
}

class _AccountTransactionsContentState extends State<AccountTransactionsContent> {
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
            Text('PHP ${MockData.accountBalance}', style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Center(
              child: InkWell(
                onTap: () {
                  context.read<NavBarProvider>().setSelectedContent(ContentEnum.ACCOUNT_DETAILS);
                },
                child: Column(
                  children: const [
                    Icon(Icons.info_outline, size: 30, color: AppColor.primaryColor),
                    Text(
                      'Details',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColor.primaryColor),
                    ),
                  ],
                ),
              ),
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
              icon: Icons.arrow_forward_outlined,
              text: 'Sent via InstaPay GXI',
              description: '*****5679',
              date: 'August 01, 2024',
              amount: '-PHP 2,000.00',
              onTap: () {
                context.read<NavBarProvider>().setSelectedContent(ContentEnum.TRANSACTION_DETAILS);
              },
            ),
            const SizedBox(height: 16),
            TransactionItem(
              icon: Icons.arrow_forward_outlined,
              text: 'W/D FR SAV BDO/0111023',
              description: '445M GRNDCNTR BDO',
              date: 'August 01, 2024',
              amount: '-PHP 5,000.00',
              onTap: () {
                context.read<NavBarProvider>().setSelectedContent(ContentEnum.TRANSACTION_DETAILS);
              },
            ),
            const SizedBox(height: 16),
            TransactionItem(
              icon: Icons.arrow_forward_outlined,
              text: 'W/D FR SAV BDO/008972',
              description: '27AMCLOVERLEA BDO',
              date: 'August 01, 2024',
              amount: '-PHP 10,000.00',
              onTap: () {
                context.read<NavBarProvider>().setSelectedContent(ContentEnum.TRANSACTION_DETAILS);
              },
            ),
            const SizedBox(height: 16),
            TransactionItem(
              icon: Icons.arrow_back_outlined,
              text: 'PAYROLL BOB',
              description: '',
              date: 'August 01, 2024',
              amount: '-PHP 10,000.00',
              onTap: () {
                context.read<NavBarProvider>().setSelectedContent(ContentEnum.TRANSACTION_DETAILS);
              },
            ),
            const SizedBox(height: 16),
            TransactionItem(
              icon: Icons.arrow_forward_outlined,
              text: 'SUNLIADAP-AFTS & REFNUM',
              description: '',
              date: 'August 01, 2024',
              amount: '-PHP 7,500.00',
              onTap: () {
                context.read<NavBarProvider>().setSelectedContent(ContentEnum.TRANSACTION_DETAILS);
              },
            ),
            const SizedBox(height: 16),
            TransactionItem(
              icon: Icons.arrow_forward_outlined,
              text: 'INTEREST WITHHELD',
              description: '',
              date: 'August 01, 2024',
              amount: '-PHP 0.11',
              onTap: () {
                context.read<NavBarProvider>().setSelectedContent(ContentEnum.TRANSACTION_DETAILS);
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
