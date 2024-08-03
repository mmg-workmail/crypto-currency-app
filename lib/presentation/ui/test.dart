import 'package:flutter/material.dart';
import 'package:my_flutter_app/ui/helper/ThemeSwitcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          actions: const [ThemeSwitcher()],
          title: const Text('Exchange'),
        ),
        body: Center(
          child: Text(AppLocalizations.of(context)!.helloWorld),
        ),
      ),
    );
  }
}
