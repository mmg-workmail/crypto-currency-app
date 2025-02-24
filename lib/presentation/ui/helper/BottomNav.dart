import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  PageController controller;
  BottomNav({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: primaryColor,
      notchMargin: 10,
      child: SizedBox(
        height: 63,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width / 2 - 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () => {
                      controller.animateToPage(
                        0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      )
                    },
                    icon: const Icon(Icons.home),
                  ),
                  IconButton(
                    onPressed: () => {
                      controller.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      )
                    },
                    icon: const Icon(Icons.bar_chart),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width / 2 - 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () => {
                      controller.animateToPage(
                        2,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      )
                    },
                    icon: const Icon(Icons.account_circle),
                  ),
                  IconButton(
                    onPressed: () => {
                      controller.animateToPage(
                        4,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      )
                    },
                    icon: const Icon(Icons.flag),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
