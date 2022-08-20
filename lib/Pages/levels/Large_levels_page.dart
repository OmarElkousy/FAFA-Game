// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/game/game_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/Providers/page_ctrlr.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../Providers/levels_provider.dart';

class LargeLevelsPage extends StatelessWidget {
  const LargeLevelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    List<FirstAidLevel> levels = context.read<LevelsProvider>().levels;

    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: [
          Row(
            children: [
              Container(
                width: _width,
                color: Colors.transparent,
                padding: EdgeInsets.fromLTRB(10, 20, 50, 20),
                child: LayoutBuilder(
                  builder: (context, constraints) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.transparent,
                        alignment: Alignment.centerRight,
                        height: constraints.maxHeight * .06,
                        width: constraints.maxWidth * .23,
                        child: FittedBox(
                          child: Text(
                            'اختر مستوي اللعبة',
                            style: TextStyle(
                              fontSize: 250,
                              color: Colors.red,
                              fontFamily: 'ElMessiri',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        color: Colors.transparent,
                        width: constraints.maxWidth * .95,
                        height: constraints.maxHeight * .85,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.vertical,
                            autoPlay: true,
                          ),
                          items: levels
                              .map(
                                (level) => ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  child: Container(
                                    color: Colors.transparent,
                                    child: LayoutBuilder(
                                      builder: (context, constraints2) => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: constraints2.maxWidth * .65,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                              child: Image.asset(
                                                  level.thumbnailAsset,
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          Container(
                                            width: constraints2.maxWidth * .35,
                                            color: Colors.black45,
                                            child: Column(
                                              children: [
                                                Container(
                                                  color: Colors.transparent,
                                                  width: constraints2.maxWidth *
                                                      .25,
                                                  height:
                                                      constraints.maxHeight *
                                                          .1,
                                                  child: AutoSizeText(
                                                    level.name,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: 'Blaka',
                                                        fontSize: 150),
                                                    maxLines: 1,
                                                  ),
                                                ),
                                                Container(
                                                  color: Colors.transparent,
                                                  width: constraints2.maxWidth *
                                                      .3,
                                                  height:
                                                      constraints.maxHeight *
                                                          .2,
                                                  child: AutoSizeText(
                                                    level.description,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 70,
                                                      fontFamily: 'ElMessiri',
                                                    ),
                                                    maxLines: 6,
                                                  ),
                                                ),
                                                Container(
                                                  color: Colors.transparent,
                                                  width: constraints2.maxWidth *
                                                      .25,
                                                  height:
                                                      constraints.maxHeight *
                                                          .1,
                                                  child: FittedBox(
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        print(level.id);
                                                        print('from level');
                                                        context
                                                            .read<
                                                                LevelsProvider>()
                                                            .changeCurrentLevelId(
                                                                level.id);
                                                        context
                                                            .read<
                                                                PageProvider>()
                                                            .changeCurrentPage(
                                                                PageTypes.game);
                                                        context
                                                            .read<
                                                                PageProvider>()
                                                            .reversePlaying();
                                                        Navigator.of(context)
                                                            .pushReplacement(
                                                                MaterialPageRoute(
                                                                    builder: (_) =>
                                                                        gameScaffold()));
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: Colors.red,
                                                      ),
                                                      child: const Text(
                                                        'ابدأ اللعب',
                                                        style: TextStyle(
                                                            fontSize: 50,
                                                            color: Colors.white,
                                                            fontFamily:
                                                                'ElMessiri',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 5.0,
            bottom: 5.0,
            child: Text(
              'كل الحقوق محفوظة للجمعية العلمية لطلبة الطب بسوهاج',
              style: TextStyle(
                  fontSize: 15, fontFamily: 'ElMessiri', color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
