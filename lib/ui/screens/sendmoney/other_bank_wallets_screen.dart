import 'package:bdo_online_clone/core/common/app_color.dart';
import 'package:bdo_online_clone/core/providers/banks_provider.dart';
import 'package:bdo_online_clone/core/utils/navigator_context.dart';
import 'package:bdo_online_clone/data/mock_bank_list.dart';
import 'package:bdo_online_clone/ui/screens/sendmoney/bank_selections_screen.dart';
import 'package:bdo_online_clone/ui/screens/sendmoney/confirm_detail_screen.dart';
import 'package:bdo_online_clone/ui/screens/sendmoney/sendmoney_favorites_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OtherBanksAndWalletsScreen extends StatefulWidget {
  static const String routeName = 'OtherBanksAndWalletsScreen';

  const OtherBanksAndWalletsScreen({super.key});

  @override
  State<OtherBanksAndWalletsScreen> createState() => _OtherBanksAndWalletsScreenState();
}

class _OtherBanksAndWalletsScreenState extends State<OtherBanksAndWalletsScreen> {
  final List<String> _bankList = Banks.list;
  final TextEditingController _bankController = TextEditingController();
  // String selectedBank = 'Select a bank to Send Money to';

  void _openBankSelectionScreen() async {
    _bankController.clear(); // Clear
    final selectedBank = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BankSelectionScreen(),
      ),
    );

    setState(() {
      _bankController.text = selectedBank;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BanksProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          title: const Text('Other Banks and Wallets'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              NavigatorContext.back();
            },
          ),
        ),
        body: SingleChildScrollView(
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
                      const Text('Send To', style: TextStyle(fontWeight: FontWeight.bold)),
                      //buildTextFieldSection('Select a bank to Send Money to', isDropdown: true, defaultValue: provider.selectedBank),
                      buildDropdownBankSelection('Select a bank to Send Money to', isDropdown: true),
                      const Text('Account Number', style: TextStyle(fontWeight: FontWeight.bold)),
                      buildTextFieldSection('Enter account number'),
                      const Text('Account Number', style: TextStyle(fontWeight: FontWeight.bold)),
                      buildTextFieldSection('Enter account name'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: TextButton.icon(
                  onPressed: () {
                   NavigatorContext.add(SendMoneyFavoritesScreen.routeName);
                  },
                  icon: const Icon(Icons.star, color: Colors.blue),
                  label: const Text('Select from Favorites', style: TextStyle(color: Colors.blue)),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: buildAmountSection('Amount', 'PHP 0.00'),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: buildTextFieldSection('Select an account to send from', isDropdown: true),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: buildTextFieldSection('Enter a note', isOptional: true),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    NavigatorContext.add(ConfirmDetailsScreen.routeName);
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
    });
  }

  Widget buildTextFieldSection(String hint,
      {bool isDropdown = false, bool isOptional = false, String defaultValue = ''}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isOptional)
            const Text(
              'Notes (Optional)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          const SizedBox(height: 5),
          isDropdown
              ? DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  //value: defaultValue,
                  hint: Text(hint),
                  onChanged: (value) {
                    // Handle dropdown value change
                  },
                  onTap: () {
                    // NavigatorContext.add(BankSelectionScreen.routeName);
                  },
                  items: _bankList.map((String text) {
                    return DropdownMenuItem(
                      value: text,
                      child: Text(text),
                    );
                  }).toList(),
                )
              : TextField(
                  decoration: InputDecoration(
                    hintText: hint,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
        ],
      ),
    );
  }

  Widget buildAmountSection(String title, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              labelText: amount,
              //hintText: amount,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  )),
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDropdownBankSelection(String labelText, {bool isDropdown = false}) {
    return InkWell(
      onTap: isDropdown ? _openBankSelectionScreen : null,
      child: AbsorbPointer(
        absorbing: isDropdown,
        child: TextFormField(
          readOnly: isDropdown,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: labelText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                )),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            suffixIcon: (isDropdown && _bankController.text.isNotEmpty)
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _bankController.clear(); // Clear the text field
                    },
                  )
                : const Icon(Icons.arrow_drop_down),
          ),
          //controller: TextEditingController(text: isDropdown ? selectedBank : ''),
          controller: _bankController,
        ),
      ),
    );
  }
}
