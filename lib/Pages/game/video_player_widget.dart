import 'package:audioplayers/audioplayers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/page_ctrlr.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/Providers/levels_provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../Providers/lives.dart';

class YoutubeVideo extends StatefulWidget {
  BoxConstraints constraints;
  String videoId;
  YoutubeVideo({Key? key, required this.videoId, required this.constraints})
      : super(key: key);

  @override
  State<YoutubeVideo> createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<YoutubeVideo> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    print('started.');
    setAudio();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    print('closed');

    super.dispose();
  }

  Future setAudio() async {
    // player.setSourceUrl(
    //   'http://commondatastorage.googleapis.com/codeskulptor-assets/week7-brrring.m4a',
    // );
    player.setSource(AssetSource('Correct_Sound.m4a'));
    playerWrong.setSource(AssetSource('Wrong.mp3'));
  }

  //variable for choices activity & color
  bool active1 = true;
  bool active2 = true;
  Color answer1Color = Color.fromRGBO(0, 0, 0, 0.259);
  Color answer2Color = Color.fromRGBO(0, 0, 0, 0.259);
  bool secondTimeChoosing = false;

  //switch modes
  late bool isAsking;

  // Breakpoints related
  bool firstTime = false;
  bool firstTime2 = false;
  int currentBreakPoint = 0;
  late List<BreakPoint> breakpoints;

  // count ctrlr
  final CountDownController _countController = CountDownController();
  final player = AudioPlayer();
  final playerWrong = AudioPlayer();

  // yt ctrlr
  late YoutubePlayerController _controller;

  @override
  void didChangeDependencies() {
    //print statements for debugging
    print(context.watch<LevelsProvider>().currentLevelId);
    print(context
        .read<LevelsProvider>()
        .getLevelById(context.read<LevelsProvider>().currentLevelId)
        .videoLink);
    print(widget.videoId);

    //Initializing the ctrlr
    _controller = YoutubePlayerController(
      initialVideoId: context
          .read<LevelsProvider>()
          .getLevelById(context.read<LevelsProvider>().currentLevelId)
          .videoLink,
      params: YoutubePlayerParams(
        autoPlay: false,
        startAt: Duration(seconds: 0),
        showControls: false,
        showFullscreenButton: false,
        strictRelatedVideos: true,
      ),
    );

    //Import the breakpoints to extract the durations
    List<BreakPoint> breakpoints =
        context.read<LevelsProvider>().getCurrentlevel().breakPoints;

    isAsking = !context.read<PageProvider>().isPlaying;
    print('initializing');
    print(context
        .read<LevelsProvider>()
        .getLevelById(context.read<LevelsProvider>().currentLevelId)
        .videoLink);

    //create a listener
    _controller.listen(
      (event) {
        for (BreakPoint breakpoint in breakpoints) {
          if (_controller.value.position.inSeconds ==
              breakpoint.timestamp.inSeconds) {
            if (breakpoint.id == currentBreakPoint) {
              print('fess');

              _controller.pause();
              setState(() {
                secondTimeChoosing = false;
                isAsking = true;
              });
              firstTime2 = true;
              breakpoint.isChecked = true;
              // new solution
            }
          }
        }
      },
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    List<BreakPoint> breakpointsWidg =
        context.read<LevelsProvider>().getCurrentlevel().breakPoints;
    return Stack(
      children: [
        Container(
          width: widget.constraints.maxWidth * .95,
          height: widget.constraints.maxHeight * .83,
          child: IgnorePointer(
            ignoring: isAsking,
            child: Visibility(
              maintainState: true,
              visible: !isAsking,
              child: YoutubePlayerIFrame(
                controller: _controller,
                aspectRatio: 16 / 9,
              ),
            ),
          ),
        ),
        Visibility(
          visible: isAsking,
          child: Container(
            width: widget.constraints.maxWidth * .95,
            height: widget.constraints.maxHeight * .83,
            padding: EdgeInsets.all(5),
            color: Colors.white30,
            child: LayoutBuilder(
              builder: ((context, qConstraints) => Column(
                    children: [
                      Center(
                        child: Container(
                          width: qConstraints.maxWidth * 0.5,
                          height: qConstraints.maxHeight * 0.25,
                          child: Stack(fit: StackFit.expand, children: [
                            AutoSizeText(
                              breakpointsWidg[currentBreakPoint].title,
                              style: TextStyle(
                                fontFamily: 'Blaka',
                                fontSize: 100,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 10
                                  ..color = Colors.black,
                              ),
                              maxLines: 1,
                            ),
                            AutoSizeText(
                              breakpointsWidg[currentBreakPoint].title,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Blaka',
                                fontSize: 100,
                              ),
                              maxLines: 1,
                            ),
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: qConstraints.maxHeight * 0.04,
                      ),
                      Container(
                        width: qConstraints.maxWidth * 0.95,
                        color: Colors.transparent,
                        height: qConstraints.maxHeight * 0.68,
                        child: Row(
                          children: [
                            Container(
                              width: qConstraints.maxWidth * 0.6,
                              height: qConstraints.maxHeight * 0.65,
                              child: Column(
                                children: [
                                  Container(
                                    width: qConstraints.maxWidth * 0.6,
                                    height: qConstraints.maxHeight * 0.3,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: answer1Color),
                                      child: AutoSizeText(
                                        breakpointsWidg[currentBreakPoint]
                                            .answer1
                                            .text,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'ElMessiri',
                                          fontSize: 70,
                                        ),
                                        maxLines: 1,
                                      ),
                                      onPressed: active1
                                          ? secondTimeChoosing
                                              ? () {}
                                              : () async {
                                                  print('pressed');
                                                  secondTimeChoosing = true;
                                                  //play sound
                                                  if (breakpointsWidg[
                                                          currentBreakPoint]
                                                      .answer1
                                                      .isCorrect) {
                                                    await player.resume();
                                                  } else {
                                                    await playerWrong.resume();
                                                  }

                                                  //change color & lives
                                                  setState(() {
                                                    active2 = false;
                                                    if (breakpointsWidg[
                                                            currentBreakPoint]
                                                        .answer1
                                                        .isCorrect) {
                                                      answer1Color =
                                                          const Color.fromARGB(
                                                              255, 35, 154, 39);
                                                    } else {
                                                      answer1Color =
                                                          const Color.fromARGB(
                                                              255, 213, 13, 13);
                                                      context
                                                          .read<Lives>()
                                                          .ReduceLivesByOne();
                                                    }

                                                    _countController.pause();
                                                  });

                                                  //delay 1 sec for sound to play
                                                  await Future.delayed(
                                                      const Duration(
                                                          seconds: 1));

                                                  // If correct: switch back to playing mode,  increase CurrentBreakpoint
                                                  // switch the color of the choice to normal

                                                  if (breakpointsWidg[
                                                          currentBreakPoint]
                                                      .answer1
                                                      .isCorrect) {
                                                    setState(() {
                                                      isAsking = false;
                                                      _controller.play();
                                                      if (currentBreakPoint !=
                                                          breakpointsWidg
                                                              .last.id) {
                                                        currentBreakPoint++;
                                                        currentBreakPoint =
                                                            breakpointsWidg[
                                                                    currentBreakPoint]
                                                                .id;
                                                      }
                                                    });
                                                    answer1Color =
                                                        const Color.fromRGBO(
                                                            0, 0, 0, 0.259);
                                                  }

                                                  // If correct: switch back to playing mode,  go back 2 seconds from the same bkpnt timestamp
                                                  // switch the color of the choice to normal

                                                  else {
                                                    setState(() {
                                                      isAsking = false;
                                                      _controller.seekTo(
                                                        breakpointsWidg[
                                                                    currentBreakPoint]
                                                                .timestamp -
                                                            Duration(
                                                                seconds: 2),
                                                      );

                                                      _controller.play();
                                                      currentBreakPoint =
                                                          breakpointsWidg[
                                                                  currentBreakPoint]
                                                              .id;
                                                      answer1Color =
                                                          const Color.fromRGBO(
                                                              0, 0, 0, 0.259);
                                                      // breakpoints[currentBreakPoint]
                                                      //     .isChecked = false;
                                                    });
                                                  }
                                                  active2 = true;
                                                }
                                          : null,
                                    ),
                                  ),
                                  SizedBox(
                                    height: qConstraints.maxHeight * 0.05,
                                  ),
                                  Container(
                                    width: qConstraints.maxWidth * 0.6,
                                    height: qConstraints.maxHeight * 0.3,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: answer2Color),
                                      child: AutoSizeText(
                                        breakpointsWidg[currentBreakPoint]
                                            .answer2
                                            .text,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'ElMessiri',
                                          fontSize: 70,
                                        ),
                                        maxLines: 1,
                                      ),
                                      onPressed: active2
                                          ? secondTimeChoosing
                                              ? () {}
                                              : () async {
                                                  print('pressed');
                                                  if (breakpointsWidg[
                                                          currentBreakPoint]
                                                      .answer2
                                                      .isCorrect) {
                                                    await player.resume();
                                                  } else {
                                                    await playerWrong.resume();
                                                  }

                                                  setState(() {
                                                    active1 = false;
                                                    if (breakpointsWidg[
                                                            currentBreakPoint]
                                                        .answer2
                                                        .isCorrect) {
                                                      answer2Color =
                                                          const Color.fromARGB(
                                                              255, 35, 154, 39);
                                                    } else {
                                                      answer2Color =
                                                          const Color.fromARGB(
                                                              255, 213, 13, 13);
                                                      context
                                                          .read<Lives>()
                                                          .ReduceLivesByOne();
                                                    }

                                                    _countController.pause();
                                                  });
                                                  await Future.delayed(
                                                      const Duration(
                                                          seconds: 1));
                                                  if (breakpointsWidg[
                                                          currentBreakPoint]
                                                      .answer2
                                                      .isCorrect) {
                                                    setState(() {
                                                      isAsking = false;
                                                      _controller.play();
                                                      if (currentBreakPoint !=
                                                          breakpointsWidg
                                                              .last.id) {
                                                        currentBreakPoint++;
                                                        currentBreakPoint =
                                                            breakpointsWidg[
                                                                    currentBreakPoint]
                                                                .id;
                                                      }
                                                    });
                                                    answer2Color =
                                                        Color.fromRGBO(
                                                            0, 0, 0, 0.259);
                                                  } else {
                                                    setState(() {
                                                      isAsking = false;
                                                      _controller.seekTo(
                                                        breakpointsWidg[
                                                                    currentBreakPoint]
                                                                .timestamp -
                                                            Duration(
                                                                seconds: 2),
                                                      );

                                                      _controller.play();
                                                      currentBreakPoint =
                                                          breakpointsWidg[
                                                                  currentBreakPoint]
                                                              .id;
                                                      answer2Color =
                                                          Color.fromRGBO(
                                                              0, 0, 0, 0.259);
                                                      // breakpoints[currentBreakPoint]
                                                      //     .isChecked = false;
                                                    });
                                                  }

                                                  active1 = true;
                                                }
                                          : null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: qConstraints.maxWidth * 0.03,
                            ),
                            Container(
                              width: qConstraints.maxWidth * 0.3,
                              height: qConstraints.maxHeight * 0.4,
                              child: CircularCountDownTimer(
                                duration: 5,
                                initialDuration: 0,
                                controller: _countController,
                                width: widget.constraints.maxWidth * .3,
                                height: widget.constraints.maxHeight * .3,
                                ringColor: Colors.black54,
                                fillColor:
                                    const Color.fromARGB(255, 136, 19, 10),
                                backgroundColor:
                                    const Color.fromARGB(255, 206, 26, 14),
                                strokeWidth: 20.0,
                                strokeCap: StrokeCap.round,
                                textStyle: const TextStyle(
                                    fontSize: 80.0,
                                    fontFamily: 'Blaka',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textFormat: CountdownTextFormat.S,
                                isReverse: true,
                                isReverseAnimation: true,
                                isTimerTextShown: true,
                                autoStart: true,
                                onStart: () {
                                  debugPrint('Countdown Started');
                                },
                                onComplete: () async {
                                  debugPrint('Countdown Ended');
                                  await playerWrong.resume();
                                  context.read<Lives>().ReduceLivesByOne();
                                  setState(() {
                                    isAsking = false;
                                    _controller.seekTo(
                                      breakpointsWidg[currentBreakPoint]
                                              .timestamp -
                                          Duration(seconds: 2),
                                    );

                                    _controller.play();
                                  });
                                },
                                onChange: (String timeStamp) {
                                  debugPrint('Countdown Changed $timeStamp');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
