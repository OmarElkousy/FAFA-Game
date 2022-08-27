import 'package:audioplayers/audioplayers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/page_ctrlr.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/Providers/levels_provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart' as fess;
import 'dart:math';

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
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 10));
    super.initState();
  }

  @override
  void dispose() {
    _controllerCenterLeft.dispose();
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
  bool showConfetti = false;

  //switch modes
  late bool isAsking;
  bool isFinished = false;
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
  late ConfettiController _controllerCenterLeft;

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
        if (context.watch<PageProvider>().isContact) {
          _controller.pause();
        }
        if (!isFinished) {
          for (BreakPoint breakpoint in breakpoints) {
            if (_controller.value.position.inSeconds ==
                    breakpoint.timestamp.inSeconds &&
                _controller.value.position.inMinutes ==
                    breakpoint.timestamp.inMinutes) {
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
        }
        if (_controller.value.playerState == fess.PlayerState.ended) {
          setState(() {
            showConfetti = true;
          });
          NAlertDialog(
            dismissable: false,
            backgroundColor: Color.fromARGB(255, 136, 19, 10),
            blur: 2,
            dialogStyle: DialogStyle(titleDivider: true),
            title: Center(
              child: Text(
                "تم الإنقاذ!",
                style: TextStyle(
                  fontFamily: 'ElMessiri',
                ),
              ),
            ),
            content: Column(
              children: [
                Text(
                  "مرحبا بك في فريق المسعفين !",
                  style: TextStyle(
                    fontFamily: 'ElMessiri',
                  ),
                ),
                Text(
                  "لقد استطعت أن تنفذ الإسعافات الأولية بالشكل الصحيح",
                  style: TextStyle(
                    fontFamily: 'ElMessiri',
                  ),
                ),
                Text(
                  "و كان متبقيا لك $currentBreakPoint محاولات أخري",
                  style: TextStyle(
                    fontFamily: 'ElMessiri',
                  ),
                ),
                Text(
                  "",
                  style: TextStyle(
                    fontFamily: 'ElMessiri',
                  ),
                ),
                Text(
                  "أكمل باقي المستويات و شارك اللعبة مع أصدقائك !",
                  style: TextStyle(
                    fontFamily: 'ElMessiri',
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 136, 19, 10),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
                child: Text(
                  'عد للبداية',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'ElMessiri',
                  ),
                ),
              )
            ],
          ).show(context);
        }
      },
    );
    super.didChangeDependencies();
  }

  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
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
              visible: !isAsking &&
                  !context.watch<PageProvider>().isContact &&
                  !showConfetti,
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
                                                      } else if (currentBreakPoint ==
                                                          breakpointsWidg
                                                              .last.id) {
                                                        isFinished = true;
                                                      }
                                                    });
                                                    answer1Color =
                                                        const Color.fromRGBO(
                                                            0, 0, 0, 0.259);
                                                  }

                                                  // If correct: switch back to playing mode,  go back 2 seconds from the same bkpnt timestamp
                                                  // switch the color of the choice to normal

                                                  else {
                                                    if (context
                                                            .read<Lives>()
                                                            .lives !=
                                                        0) {
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
                                                            const Color
                                                                    .fromRGBO(
                                                                0, 0, 0, 0.259);
                                                        // breakpoints[currentBreakPoint]
                                                        //     .isChecked = false;
                                                      });
                                                    } else {
                                                      isAsking = false;
                                                      answer1Color =
                                                          const Color.fromRGBO(
                                                              0, 0, 0, 0.259);
                                                      await NAlertDialog(
                                                        dismissable: false,
                                                        backgroundColor:
                                                            Color.fromARGB(255,
                                                                136, 19, 10),
                                                        blur: 2,
                                                        dialogStyle:
                                                            DialogStyle(
                                                                titleDivider:
                                                                    true),
                                                        title: Center(
                                                          child: Text(
                                                            "حاول مرة أخري",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'ElMessiri',
                                                            ),
                                                          ),
                                                        ),
                                                        content: Text(
                                                          "عليك أن تختار الإجابة الصحيحة بالسرعة المناسبة",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'ElMessiri',
                                                          ),
                                                        ),
                                                        actions: <Widget>[
                                                          ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              primary: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      136,
                                                                      19,
                                                                      10),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pushReplacementNamed(
                                                                      '/');
                                                            },
                                                            child: Text(
                                                              'عد للبداية',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    'ElMessiri',
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ).show(context);
                                                    }
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
                                                      } else if (currentBreakPoint ==
                                                          breakpointsWidg
                                                              .last.id) {
                                                        isFinished = true;
                                                      }
                                                    });
                                                    answer2Color =
                                                        Color.fromRGBO(
                                                            0, 0, 0, 0.259);
                                                  } else {
                                                    {
                                                      if (context
                                                              .read<Lives>()
                                                              .lives !=
                                                          0) {
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
                                                              const Color
                                                                      .fromRGBO(
                                                                  0,
                                                                  0,
                                                                  0,
                                                                  0.259);
                                                          // breakpoints[currentBreakPoint]
                                                          //     .isChecked = false;
                                                        });
                                                      } else {
                                                        isAsking = false;
                                                        answer2Color =
                                                            const Color
                                                                    .fromRGBO(
                                                                0, 0, 0, 0.259);
                                                        await NAlertDialog(
                                                          dismissable: false,
                                                          backgroundColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  136,
                                                                  19,
                                                                  10),
                                                          blur: 2,
                                                          dialogStyle:
                                                              DialogStyle(
                                                                  titleDivider:
                                                                      true),
                                                          title: Center(
                                                            child: Text(
                                                              "حاول مرة أخري",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'ElMessiri',
                                                              ),
                                                            ),
                                                          ),
                                                          content: Text(
                                                            "عليك أن تختار الإجابة الصحيحة بالسرعة المناسبة",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'ElMessiri',
                                                            ),
                                                          ),
                                                          actions: <Widget>[
                                                            ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                primary: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        136,
                                                                        19,
                                                                        10),
                                                              ),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pushReplacementNamed(
                                                                        '/');
                                                              },
                                                              child: Text(
                                                                'عد للبداية',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      'ElMessiri',
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ).show(context);
                                                      }
                                                    }
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
                                duration: 7,
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
                                  setState(() async {
                                    if (context.read<Lives>().lives != 0) {
                                      isAsking = false;
                                      _controller.seekTo(
                                        breakpointsWidg[currentBreakPoint]
                                                .timestamp -
                                            Duration(seconds: 2),
                                      );

                                      _controller.play();
                                    } else {
                                      answer1Color =
                                          const Color.fromRGBO(0, 0, 0, 0.259);
                                      await NAlertDialog(
                                        dismissable: false,
                                        backgroundColor:
                                            Color.fromARGB(255, 136, 19, 10),
                                        blur: 2,
                                        dialogStyle:
                                            DialogStyle(titleDivider: true),
                                        title: Center(
                                          child: Text(
                                            "حاول مرة أخري",
                                            style: TextStyle(
                                              fontFamily: 'ElMessiri',
                                            ),
                                          ),
                                        ),
                                        content: Text(
                                          "عليك أن تختار الإجابة الصحيحة بالسرعة المناسبة",
                                          style: TextStyle(
                                            fontFamily: 'ElMessiri',
                                          ),
                                        ),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Color.fromARGB(
                                                  255, 136, 19, 10),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushReplacementNamed('/');
                                            },
                                            child: Text(
                                              'عد للبداية',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'ElMessiri',
                                              ),
                                            ),
                                          )
                                        ],
                                      ).show(context);
                                      isAsking = false;
                                    }
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
        Align(
          alignment: Alignment.centerLeft,
          child: ConfettiWidget(
            confettiController: _controllerCenterLeft,
            blastDirection: 0, // radial value - RIGHT
            emissionFrequency: 0.6,
            minimumSize: const Size(10,
                10), // set the minimum potential size for the confetti (width, height)
            maximumSize: const Size(50,
                50), // set the maximum potential size for the confetti (width, height)
            numberOfParticles: 5,
            gravity: 0.1,
          ),
        ),
      ],
    );
  }
}
