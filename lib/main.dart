import 'package:flutter/material.dart';
import 'package:flutter_app/Constants/style.dart';
import 'package:flutter_app/Pages/game/game_scaffold.dart';
import 'package:flutter_app/Providers/levels_provider.dart';
import 'package:flutter_app/Providers/lives.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/Providers/fafa.dart';
import 'package:flutter_app/site_Layout.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Providers/page_ctrlr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LevelsProvider>(
      create: (context) => LevelsProvider(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/second': (context) => gameScaffold(),
        },
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        // ignore: prefer_const_literals_to_create_immutables
        supportedLocales: [
          const Locale('ar', ''), // English, no country code
          // Spanish, no country code
        ],
        title: 'Do Not DISTURBI',
        theme: ThemeData(
          scaffoldBackgroundColor: dark,

          // ignore: prefer_const_literals_to_create_immutables
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          }),
          primaryColor: Colors.blue,
        ),
        home: ChangeNotifierProvider(
          create: (context) => FAFAprovider(),
          child: ChangeNotifierProvider(
            create: (context) => PageProvider(),
            child: SiteLayout(),
          ),
        ),
      ),
    );
  }
}
