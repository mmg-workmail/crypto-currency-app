import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter_app/logic/providers/ThemeProvider.dart';
import 'package:my_flutter_app/logic/providers/UserViewProvider.dart';
import 'package:my_flutter_app/logic/providers/cryptoDataProvider.dart';
import 'package:my_flutter_app/logic/providers/marketViewProvider.dart';
import 'package:my_flutter_app/presentation/ui/layout/MainWraper.dart';
import 'package:my_flutter_app/presentation/ui/pages/auth/SignUpScreen.dart';

import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Themeprovider()),
      // ChangeNotifierProvider(create: (context) => CryptoDataProvider()),
      ChangeNotifierProvider(create: (context) => MarketViewprovider()),
      ChangeNotifierProvider(create: (context) => UserViewProvider()),
    ],
    child: const MyMaterialApp(),
  ));
}

class MyMaterialApp extends StatefulWidget {
  const MyMaterialApp({super.key});

  @override
  State<MyMaterialApp> createState() => _MyMaterialAppState();
}

class _MyMaterialAppState extends State<MyMaterialApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Themeprovider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        themeMode: themeProvider.themeMode,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        debugShowCheckedModeBanner: false,
        locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'), // English
          Locale('fa'), // Persian
        ],
        home: Directionality(
          textDirection: TextDirection.ltr,
          child: FutureBuilder<SharedPreferences>(
            future: SharedPreferences.getInstance(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                SharedPreferences sharedPreferences = snapshot.data!;
                var loggedInState =
                    sharedPreferences.getBool('loggedIn') ?? false;

                if (loggedInState) {
                  return const MainWraper();
                } else {
                  return const SignUpScreen();
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
        // home: const Directionality(
        //   textDirection: TextDirection.ltr,
        //   // child: MainWraper(),
        //   child: SignUpScreen(),
        // ),
      );
    });
  }
}
