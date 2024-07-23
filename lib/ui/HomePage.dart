import 'package:flutter/material.dart';
import 'package:my_flutter_app/ui/helper/HomePageView.dart';
import 'package:my_flutter_app/ui/helper/ThemeSwitcher.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageViewController = PageController(
    initialPage: 0,
  );

  var defaultChoiceIndex = 0;

  final List<String> _choicesList = [
    'Top MarketCaps',
    'Top Gainers',
    'Top Losers'
  ];

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    var textTheme = Theme.of(context).textTheme;
    var iconTheme = Theme.of(context).iconTheme;

    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        actions: const [
          ThemeSwitcher(),
        ],
        iconTheme: iconTheme,
        titleTextStyle: textTheme.titleLarge,
        title: const Text('Flutter Course A'),
      ),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 5, right: 5),
                  child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        HomePageView(controller: _pageViewController),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: SmoothPageIndicator(
                                controller: _pageViewController,
                                count: 4,
                                effect: const ExpandingDotsEffect(
                                  dotHeight: 10,
                                  dotWidth: 10,
                                ),
                                onDotClicked: (index) =>
                                    _pageViewController.animateToPage(
                                      index,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => {},
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            padding: const EdgeInsets.all(15),
                            backgroundColor: Colors.green[700],
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Buy'),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            padding: const EdgeInsets.all(15),
                            backgroundColor: Colors.red[700],
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Sell'),
                          onPressed: () => {},
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    children: [
                      Wrap(
                        spacing: 8,
                        children: List.generate(
                          _choicesList.length,
                          (index) {
                            return ChoiceChip(
                              label: Text(
                                _choicesList[index],
                                style: textTheme.titleSmall,
                              ),
                              selected: defaultChoiceIndex == index,
                              selectedColor: Colors.blue,
                              onSelected: (value) => {
                                setState(() {
                                  defaultChoiceIndex =
                                      value ? index : defaultChoiceIndex;
                                })
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
