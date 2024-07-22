import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  var controller;
  HomePageView({super.key, required this.controller});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  var images = [
    'images/1.png',
    'images/2.png',
    'images/3.png',
    'images/4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return PageView(
      allowImplicitScrolling: true,
      controller: widget.controller,
      children: [
        myPages(images[0]),
        myPages(images[1]),
        myPages(images[2]),
        myPages(images[3]),
      ],
    );
  }
}

Widget myPages(String image) {
  return ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(30)),
    child: Image(
      image: AssetImage(image),
      fit: BoxFit.fill,
    ),
  );
}
