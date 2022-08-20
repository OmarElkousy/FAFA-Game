import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/game/Large_game_page.dart';
import 'package:flutter_app/Pages/game/Medium_game_page.dart';
import 'package:flutter_app/Pages/game/Small_game_page.dart';
import 'package:flutter_app/Providers/levels_provider.dart';
import 'package:flutter_app/Providers/page_ctrlr.dart';

import 'Pages/Intro_Page.dart';
import 'Pages/levels/Large_levels_page.dart';

import 'Pages/levels/Medium_levels_page.dart';
import 'Pages/levels/Small_levels_page.dart';
import 'Pages/medium_Intro_Page.dart';
import 'Pages/small_Intro_Page .dart';
import 'helpers/responsive_widegt.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/Constants/style.dart' as fess;

class PageNavigator extends StatelessWidget {
  const PageNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    switch (context.watch<PageProvider>().currentPage) {
      case PageTypes.intro:
        return ResponsiveWidget(
            largeScreen: LargeIntroPage(),
            mediumScreen: MediumIntroPage(),
            smallScreen: SmallIntroPage());

      case PageTypes.levels:
        return ResponsiveWidget(
          largeScreen: LargeLevelsPage(),
          mediumScreen: _width > 950 ? LargeLevelsPage() : MediumLevelsPage(),
          smallScreen: SmallLevelsPage(),
        );

      default:
        return ResponsiveWidget(
          largeScreen: LargeIntroPage(),
          mediumScreen: MediumIntroPage(),
          smallScreen: SmallIntroPage(),
        );
    }
  }
}
