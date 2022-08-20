// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/medium_Intro_Page.dart';
import 'package:flutter_app/Pages/small_Intro_Page%20.dart';
import 'package:flutter_app/Providers/levels_provider.dart';
import 'package:flutter_app/Widgets/side_menu.dart';
import 'package:flutter_app/Widgets/top_navbar.dart';
import 'package:flutter_app/helpers/responsive_widegt.dart';
import 'package:flutter_app/Widgets/large_Screen.dart';
import 'package:flutter_app/Widgets/small_screen.dart';
import 'package:provider/provider.dart';
import 'Page_Navigator.dart';
import 'Pages/Intro_Page.dart';
import 'Providers/page_ctrlr.dart';

class SiteLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: topNavigationBar(context),
      drawer: const Drawer(
        child: SideMenu(),
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
          PageNavigator(),
        ],
      ),
    );
  }
}
