import 'package:bdo_online_clone/core/common/app_color.dart';
import 'package:bdo_online_clone/core/providers/banks_provider.dart';
import 'package:bdo_online_clone/core/utils/string_utils.dart';
import 'package:bdo_online_clone/data/mock_favorite_list.dart';
import 'package:bdo_online_clone/data/models/favorite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SendMoneyFavoritesScreen extends StatefulWidget {
  static const String routeName = 'SendMoneyFavoritesScreen';

  const SendMoneyFavoritesScreen({super.key});
  @override
  _SendMoneyFavoritesScreenState createState() => _SendMoneyFavoritesScreenState();
}

class _SendMoneyFavoritesScreenState extends State<SendMoneyFavoritesScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Favorite> _favoriteList = Favorites.list;
  List<Favorite> _filteredFavoriteList = [];

  @override
  void initState() {
    super.initState();
    _filteredFavoriteList = _favoriteList;
  }

  void _filterBanks(String query) {
    setState(() {
      _filteredFavoriteList =
          _favoriteList.where((fav) => fav.name.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BanksProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          title: const Text('Send Money'),
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
                  hintText: 'Search favorites',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                  child: ListView.builder(
                    itemCount: _filteredFavoriteList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pop(context, _filteredFavoriteList[index]);
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.lightBlueAccent.withOpacity(0.25),
                                        shape: BoxShape.circle,
                                        //more than 50% of width makes circle
                                      ),
                                      child: Center(
                                        child: Text(
                                          StringUtils.getInitials(_filteredFavoriteList[index].name),
                                          style: const TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _filteredFavoriteList[index].name,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        _filteredFavoriteList[index].description,
                                      ),
                                      Text(
                                        _filteredFavoriteList[index].amount.toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            if (index < (_filteredFavoriteList.length - 1)) ...[
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Divider(),
                              ), //
                            ], // Adds a divider between items
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.check_circle_outline_rounded, size: 28, color: Colors.teal),
                  Text("You've reached the end of the list")
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      );
    });
  }
}
