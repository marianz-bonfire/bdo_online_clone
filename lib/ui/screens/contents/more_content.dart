import 'package:bdo_online_clone/core/common/app_color.dart';
import 'package:bdo_online_clone/ui/widgets/selection_card.dart';
import 'package:flutter/material.dart';

class MoreContent extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  const MoreContent({super.key});

  @override
  State<MoreContent> createState() => _MoreContentState();
}

class _MoreContentState extends State<MoreContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Account & Security',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SelectionCard(
            icon: Icons.store_mall_directory_outlined,
            text: 'Manage Account',
            description: 'Add and secure your accounts',
            onTap: () {},
          ),
          const SizedBox(height: 10),
          SelectionCard(
            icon: Icons.credit_card_outlined,
            text: 'Manage Cards',
            description: 'Edit your card security and settings',
            onTap: () {},
          ),
          const SizedBox(height: 10),
          SelectionCard(
            icon: Icons.login,
            text: 'Manage Login',
            description: 'Manage your login options',
            onTap: () {},
          ),
          const SizedBox(height: 10),
          SelectionCard(
            icon: Icons.person_add_alt,
            text: 'Update Profile',
            description: 'Update your personal information',
            onTap: () {},
          ),
          const SizedBox(height: 10),
          SelectionCard(
            icon: Icons.star_border,
            text: 'Manage Favorites',
            description: 'Manage all favorites',
            onTap: () {},
          ),
          const SizedBox(height: 20),
          const Text(
            'Other Services',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SelectionCard(
            icon: Icons.spa_outlined,
            text: 'Manage Investments',
            description: 'Manage your Trust Accounts',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget buildCard(IconData? iconData, String text, String description) {
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
                Icon(iconData, size: 40, color: AppColor.primaryDarkerColor),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        description,
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
