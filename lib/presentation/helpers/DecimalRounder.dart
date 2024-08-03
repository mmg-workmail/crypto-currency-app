import 'package:flutter/material.dart';

class DecimalRounder {
  static String removePriceDecimals(price) {
    String finalPrice;

    if (price! < 1) {
      finalPrice = price.toStringAsFixed(6);
    } else if (price! < 10) {
      finalPrice = price.toStringAsFixed(5);
    } else if (price! < 100) {
      finalPrice = price.toStringAsFixed(4);
    } else {
      finalPrice = price.toStringAsFixed(2);
    }

    return finalPrice;
  }

  static String removeChartPriceDecimals(price) {
    String finalPrice;

    if (price! < 1) {
      finalPrice = price.toStringAsFixed(4);
    } else if (price! < 10) {
      finalPrice = price.toStringAsFixed(4);
    } else if (price! < 100) {
      finalPrice = price.toStringAsFixed(2);
    } else {
      finalPrice = price.toStringAsFixed(0);
    }

    return finalPrice;
  }

  static String removePercentDecimals(percent24) {
    String precentChange;

    if (percent24 > 10000) {
      precentChange = percent24.toStringAsFixed(0);
    } else {
      precentChange = percent24.toStringAsFixed(2);
    }

    return precentChange;
  }

  static MaterialColor setColorFilter(precent24) {
    MaterialColor filterColor;
    if (precent24 >= 0.0) {
      filterColor = Colors.green;
    } else {
      filterColor = Colors.red;
    }
    return filterColor;
  }

  static Color setPrecentChangesColor(precent24) {
    Color precentColor;

    if (precent24 < 0) {
      precentColor = Colors.red;
    } else if (precent24 > 0) {
      precentColor = Colors.green;
    } else {
      precentColor = Colors.white;
    }

    return precentColor;
  }

  static Icon setPrecentChangesIcon(precent24) {
    Icon precentIcon;

    if (precent24 < 0) {
      precentIcon = const Icon(
        Icons.arrow_drop_down,
        color: Colors.red,
      );
    } else if (precent24 > 0) {
      precentIcon = const Icon(
        Icons.arrow_drop_up,
        color: Colors.green,
      );
    } else {
      precentIcon = const Icon(
        Icons.minimize,
        color: Colors.grey,
      );
      ;
    }

    return precentIcon;
  }
}
