import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class LatestNews extends StatelessWidget {
  const LatestNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 30,
      child: Marquee(
        text: 'This is a sample test',
        scrollAxis: Axis.horizontal,
      ),
    );
  }
}
