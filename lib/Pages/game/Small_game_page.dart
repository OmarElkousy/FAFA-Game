import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/levels_provider.dart';

class SmallGamePage extends StatefulWidget {
  const SmallGamePage({Key? key}) : super(key: key);

  @override
  State<SmallGamePage> createState() => _SmallGamePageState();
}

class _SmallGamePageState extends State<SmallGamePage> {
  bool isPaused = false;
  @override
  Widget build(BuildContext context) {
    int currentLevelId = context.read<LevelsProvider>().currentLevelId;
    FirstAidLevel currentLevel =
        context.read<LevelsProvider>().getLevelById(currentLevelId);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Stack(
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
              color: Colors.red,
              padding: EdgeInsets.fromLTRB(10, 20, 20, 20),
              child: LayoutBuilder(
                  builder: ((context, constraints) => Column(
                        children: [
                          Container(
                            color: Colors.amber,
                            width: constraints.maxWidth,
                            height: constraints.maxHeight * .45,
                          ),
                          SizedBox(
                            height: constraints.maxHeight * .02,
                          ),
                          Container(
                            color: Colors.amber,
                            width: constraints.maxWidth,
                            height: constraints.maxHeight * .35,
                          ),
                          SizedBox(
                            height: constraints.maxHeight * .02,
                          ),
                          Container(
                            color: Colors.amber,
                            width: constraints.maxWidth,
                            height: constraints.maxHeight * .08,
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
                                          Icon(
                                            Icons.heart_broken,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            width: constraints.maxWidth * .01,
                                          ),
                                          Icon(
                                            Icons.heart_broken,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            width: constraints.maxWidth * .01,
                                          ),
                                          Icon(
                                            Icons.heart_broken,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            width: constraints.maxWidth * .01,
                                          ),
                                          Icon(
                                            Icons.heart_broken,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            width: constraints.maxWidth * .01,
                                          ),
                                          Icon(
                                            Icons.heart_broken,
                                            size: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  child: Container(
                                    color: Colors.transparent,
                                    width: constraints.maxWidth * .15,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              isPaused = true;
                                            });
                                          },
                                          child: Container(
                                            width: constraints.maxWidth * .07,
                                            height: constraints.maxHeight * .08,
                                            color: isPaused
                                                ? Colors.white54
                                                : Colors.white70,
                                            child: FittedBox(
                                              child: Icon(
                                                Icons.pause,
                                                size: 50,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                isPaused = false;
                                              });
                                            },
                                            child: Container(
                                              width: constraints.maxWidth * .07,
                                              height:
                                                  constraints.maxHeight * .08,
                                              color: isPaused
                                                  ? Colors.white70
                                                  : Colors.white54,
                                              child: FittedBox(
                                                child: Icon(
                                                  Icons.play_arrow,
                                                  size: 50,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))),
            ),
          ],
        ),
      ],
    );
  }
}
