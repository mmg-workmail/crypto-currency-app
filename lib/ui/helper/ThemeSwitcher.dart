import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/providers/ThemeProvider.dart';
import 'package:provider/provider.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<Themeprovider>(context);
    var switchIcon = Icon(themeProvider.isDarkMode
        ? CupertinoIcons.moon_fill
        : CupertinoIcons.sun_max_fill);

    return IconButton(
      onPressed: () {
        themeProvider.toggleTheme();
      },
      icon: switchIcon,
    );
  }
}
