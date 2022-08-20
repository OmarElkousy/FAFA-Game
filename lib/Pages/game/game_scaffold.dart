// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/game/Large_game_page.dart';
import 'package:flutter_app/Pages/medium_Intro_Page.dart';
import 'package:flutter_app/Pages/small_Intro_Page%20.dart';
import 'package:flutter_app/Providers/levels_provider.dart';
import 'package:flutter_app/Providers/page_ctrlr.dart';
import 'package:flutter_app/Widgets/side_menu.dart';
import 'package:flutter_app/Widgets/top_navbar.dart';
import 'package:flutter_app/helpers/responsive_widegt.dart';
import 'package:flutter_app/Widgets/large_Screen.dart';
import 'package:flutter_app/Widgets/small_screen.dart';
import 'package:flutter_app/site_Layout.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/Constants/style.dart';

import '../../Page_Navigator.dart';

class gameScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PageProvider>(create: (_) => PageProvider()),
      ],
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            leading: Center(
              child: FittedBox(
                child: Consumer<PageProvider>(
                  builder: (context, value, child) => IconButton(
                    onPressed: () {
                      if (context.read<PageProvider>().currentPage ==
                          (PageTypes.game)) {
                        context.read<PageProvider>().reversePlaying();
                      }
                      context
                          .read<PageProvider>()
                          .changeCurrentPage(PageTypes.intro);
                      Navigator.of(context).pushReplacementNamed('/');
                    },
                    iconSize: 50,
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            title: Row(
              children: [
                Expanded(
                  child: Container(),
                ),
                Container(
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  height: 80,
                  width: 100,
                  child: FittedBox(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          side: const BorderSide(width: 6, color: Colors.red)),
                      child: const Text(
                        'تواصل معنا',
                        style: TextStyle(
                            fontSize: 50,
                            fontFamily: 'ElMessiri',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            iconTheme: IconThemeData(color: dark),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Stack(
            children: [
              Positioned(
                right: 0.0,
                left: 0.0,
                bottom: 0.0,
                child: Container(
                  width: _width,
                  height: _height,
                  color: Colors.transparent,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Opacity(
                      opacity: .5,
                      child: Image.asset(
                        'assets/images/smoky.gif',
                      ),
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Opacity(
                                  opacity: 0.12,
                                  child: Transform.translate(
                                    offset: Offset(0, -_width > 400 ? -70 : 0),
                                    child: Text(
                                      'لعبة',
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily: 'Blaka',
                                        fontSize: _width > 780
                                            ? 400
                                            : _width > 400
                                                ? 250
                                                : 150,
                                        letterSpacing: 10.0,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 4
                                          ..color = Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Opacity(
                                  opacity: 0.12,
                                  child: Transform.translate(
                                    offset: Offset(0, _width > 400 ? -100 : 0),
                                    child: Text(
                                      'الإسعافات',
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                        fontFamily: 'Blaka',
                                        fontSize: _width > 780
                                            ? 400
                                            : _width > 400
                                                ? 250
                                                : 150,
                                        letterSpacing: 10.0,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 4
                                          ..color = Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              LargeGamePage(),
            ],
          ),
        );
      },
    );
  }
}
