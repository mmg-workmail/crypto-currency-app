import 'package:flutter/material.dart';
import 'package:my_flutter_app/logic/providers/cryptoDataProvider.dart';
import 'package:my_flutter_app/presentation/ui/helper/BottomNav.dart';

import 'package:my_flutter_app/presentation/ui/pages/home/Homepage.dart';
import 'package:my_flutter_app/presentation/ui/pages/market/MarketPage.dart';
import 'package:my_flutter_app/presentation/ui/ProfilePage.dart';
import 'package:my_flutter_app/presentation/ui/WatchListPage.dart';
import 'package:provider/provider.dart';

class MainWraper extends StatefulWidget {
  const MainWraper({super.key});

  @override
  State<MainWraper> createState() => _MainWraperState();
}

class _MainWraperState extends State<MainWraper> {
  final PageController _myPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(Icons.compare_arrows_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNav(
        controller: _myPage,
      ),
      body: PageView(
        controller: _myPage,
        children: [
          HomePage(),
          MarketPage(),
          // ChangeNotifierProvider<CryptoDataProvider>(
          //   create: (context) => CryptoDataProvider(),
          //   child: const MarketPage(),
          // ),
          ProfilePage(),
          WatchListPage(),
        ],
      ),
    );
  }
}
