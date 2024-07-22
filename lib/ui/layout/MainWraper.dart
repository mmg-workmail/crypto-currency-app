import 'package:flutter/material.dart';
import 'package:my_flutter_app/ui/helper/BottomNav.dart';

import 'package:my_flutter_app/ui/Homepage.dart';
import 'package:my_flutter_app/ui/MarketPage.dart';
import 'package:my_flutter_app/ui/ProfilePage.dart';
import 'package:my_flutter_app/ui/WatchListPage.dart';

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
          ProfilePage(),
          WatchListPage(),
        ],
      ),
    );
  }
}
