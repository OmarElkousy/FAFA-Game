import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/game/video_player_widget.dart';
import 'package:flutter_app/Providers/lives.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/Providers/levels_provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../Widgets/VideoPlayer.dart';

import 'package:flutter_app/Constants/style.dart';

class LargeGamePage extends StatefulWidget {
  LargeGamePage({
    Key? key,
  }) : super(key: key);

  @override
  State<LargeGamePage> createState() => _LargeGamePageState();
}

class _LargeGamePageState extends State<LargeGamePage> {
  @override
  Widget build(BuildContext context) {
    int currentLevelId = context.read<LevelsProvider>().currentLevelId;
    print(currentLevelId);
    print('from large page');
    FirstAidLevel currentLevel =
        context.watch<LevelsProvider>().getCurrentlevel();
    double _width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider<Lives>(
      create: (context) => Lives(),
      child: Stack(
        children: [
          Positioned(
            right: 5.0,
            bottom: 5.0,
            child: Container(
              // ignore: prefer_const_constructors
              child: AutoSizeText(
                'كل الحقوق محفوظة للجمعية العلمية لطلبة الطب بسوهاج',
                // ignore: prefer_const_constructors
                style: TextStyle(
                    fontSize: 15, fontFamily: 'ElMessiri', color: Colors.white),
              ),
            ),
          ),
          Container(
            width: _width,
            color: Colors.transparent,
            padding: const EdgeInsets.fromLTRB(10, 10, 20, 20),
            child: LayoutBuilder(
              builder: (context, constraints) => Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    child: Container(
                        width: constraints.maxWidth * .95,
                        height: constraints.maxHeight * .83,
                        color: Colors.transparent,
                        child: YoutubeVideo(
                          videoId: currentLevel.videoLink,
                          constraints: constraints,
                        )),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .02,
                  ),
                  Container(
                    color: Colors.transparent,
                    width: constraints.maxWidth * .95,
                    height: constraints.maxHeight * .1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(2),
                            color: Colors.white70,
                            width: constraints.maxWidth * .35,
                            child: FittedBox(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    if (context.watch<Lives>().lives != 0)
                                      ...List.generate(
                                        context.watch<Lives>().lives,
                                        (index) => Row(
                                          children: [
                                            Icon(
                                              Icons.health_and_safety_rounded,
                                              size: 50,
                                              color: Colors.red,
                                            ),
                                            SizedBox(
                                              width: constraints.maxWidth * .01,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ...List.generate(
                                      5 - context.watch<Lives>().lives,
                                      (index) => Row(
                                        children: [
                                          Icon(
                                            Icons.heart_broken,
                                            size: 50,
                                          ),
                                          SizedBox(
                                            width: constraints.maxWidth * .01,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
