import 'package:bdo_online_clone/core/common/app_color.dart';
import 'package:bdo_online_clone/core/providers/banks_provider.dart';
import 'package:bdo_online_clone/data/mock_bank_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BankSelectionScreen extends StatefulWidget {
  static const String routeName = 'BankSelectionScreen';

  const BankSelectionScreen({super.key});
  @override
  _BankSelectionScreenState createState() => _BankSelectionScreenState();
}

class _BankSelectionScreenState extends State<BankSelectionScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> _bankList = Banks.list;
  List<String> _filteredBankList = [];

  @override
  void initState() {
    super.initState();
    _filteredBankList = _bankList;
  }

  void _filterBanks(String query) {
    setState(() {
      _filteredBankList = _bankList.where((bank) => bank.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BanksProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          title: const Text('Select a bank'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, '');
            },
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                onChanged: _filterBanks,
                decoration: InputDecoration(
                  hintText: 'Search banks',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredBankList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          _filteredBankList[index],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          //provider.setSelectedBank( _filteredBankList[index]);
                          Navigator.pop(context, _filteredBankList[index]);
                        },
                      ),
                      const Divider(), // Adds a divider between items
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
