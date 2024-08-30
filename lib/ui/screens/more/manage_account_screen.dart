import 'package:bdo_online_clone/core/common/app_color.dart';
import 'package:bdo_online_clone/core/utils/navigator_context.dart';
import 'package:bdo_online_clone/ui/screens/more/add_remove_account_screen.dart';
import 'package:bdo_online_clone/ui/screens/more/show_hide_account_screen.dart';
import 'package:bdo_online_clone/ui/widgets/selection_card.dart';
import 'package:flutter/material.dart';

class ManageAccountScreen extends StatelessWidget {
  static const String routeName = 'ManageAccountScreen';

  const ManageAccountScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text('Manage Accounts'),
      ),
      body:Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectionCard(
              icon: Icons.account_balance_outlined,
              text: 'Add or Remove Own Account',
              description: 'Add or remove your account',
              onTap: () {
                NavigatorContext.add(AddRemoveAccountScreen.routeName);
              },
            ),
            const SizedBox(height: 10),
            SelectionCard(
              icon: Icons.visibility_outlined,
              text: 'Show or Hide Account',
              description: 'Select which accounts to display',
              onTap: () {
                NavigatorContext.add(ShowHideAccountScreen.routeName);
              },
            ),
            const SizedBox(height: 10),
            SelectionCard(
              icon: Icons.food_bank_outlined,
              text: 'Assign an Account to a Mobile Number',
              description: 'Receive money via mobile number',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}