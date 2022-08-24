// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/Providers/page_ctrlr.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../Providers/levels_provider.dart';
import '../game/game_scaffold.dart';

class SmallLevelsPage extends StatelessWidget {
  const SmallLevelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    List<FirstAidLevel> levels = context.read<LevelsProvider>().levels;
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: [
          Positioned(
            right: 5.0,
            bottom: 5.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'كل الحقوق محفوظة للجمعية ',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'ElMessiri',
                      color: Colors.white60),
                ),
                Text(
                  ' العلمية لطلبة الطب بسوهاج',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'ElMessiri',
                      color: Colors.white60),
                ),
              ],
            ),
          ),
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
                        height: constraints.maxHeight * .15,
                        width: constraints.maxWidth * .7,
                        child: FittedBox(
                          child: AutoSizeText(
                            'اختر مستوي اللعبة',
                            maxLines: 1,
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
                        height: constraints.maxHeight * .75,
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
                                    color: Colors.black45,
                                    child: LayoutBuilder(
                                      builder: (context, constraints2) =>
                                          Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: constraints2.maxWidth * .5,
                                            height: constraints2.maxHeight * .1,
                                            color: Colors.transparent,
                                            alignment: Alignment.center,
                                            child: AutoSizeText(
                                              level.name,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Blaka',
                                                  fontSize: 150),
                                              maxLines: 1,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            width: constraints2.maxWidth * .95,
                                            height:
                                                constraints2.maxHeight * .62,
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
                                            width: constraints2.maxWidth * .95,
                                            height:
                                                constraints2.maxHeight * .22,
                                            color: Colors.transparent,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  color: Colors.transparent,
                                                  width: constraints2.maxWidth *
                                                      .55,
                                                  height:
                                                      constraints.maxHeight *
                                                          .18,
                                                  child: AutoSizeText(
                                                    level.description,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 70,
                                                      fontFamily: 'ElMessiri',
                                                    ),
                                                    maxLines: 3,
                                                  ),
                                                ),
                                                Container(
                                                  color: Colors.transparent,
                                                  width: constraints2.maxWidth *
                                                      .3,
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
        ],
      ),
    );
  }
}
