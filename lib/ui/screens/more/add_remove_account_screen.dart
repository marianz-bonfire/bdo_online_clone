import 'package:bdo_online_clone/core/common/app_color.dart';
import 'package:bdo_online_clone/data/mock_data.dart';
import 'package:bdo_online_clone/ui/widgets/selection_card.dart';
import 'package:bdo_online_clone/ui/widgets/selection_item.dart';
import 'package:flutter/material.dart';

class AddRemoveAccountScreen extends StatelessWidget {
  static const String routeName = 'AddRemoveAccountScreen';

  const AddRemoveAccountScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text('Add or Remove Own Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectionCard(
              icon: Icons.account_balance_outlined,
              text: 'Add Own Account',
              description: '',
              onTap: () {},
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Savings Accounts',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  SelectionItem(
                    icon: Icons.account_balance_outlined,
                    text: MockData.accountNickName,
                    description: MockData.accountNumber,
                    onTap: () {
                      //NavigatorContext.add(ManageCardsScreen.routeName);
                    },
                    iconRight: Icons.delete_outline,
                    iconRightColor: AppColor.errorColor,
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Credit Cards',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  SelectionItem(
                    icon: Icons.credit_card_outlined,
                    text: MockData.creditCardName,
                    description: MockData.creditCardNumber,
                    onTap: () {},
                    iconRight: Icons.delete_outline,
                    iconRightColor: AppColor.errorColor,
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
