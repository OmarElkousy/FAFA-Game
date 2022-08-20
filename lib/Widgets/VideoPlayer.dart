import 'package:flutter/material.dart';

import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPlayer extends StatefulWidget {
  final String videoUrl;
  VideoPlayer({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'UnjMyBko2Ac',
    params: YoutubePlayerParams(
        autoPlay: true,
        // Defining custom playlist
        startAt: Duration(seconds: 0),
        showControls: false,
        showFullscreenButton: false,
        strictRelatedVideos: true),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.hidePauseOverlay();

    return YoutubePlayerControllerProvider(
      // Provides controller to all the widget below it.
      controller: _controller,

      child: GestureDetector(
        onTap: _controller.value.hasPlayed
            ? () {
                print('it has');
              }
            : () {
                print('nopr');
              },
        child: YoutubePlayerIFrame(
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }
}
