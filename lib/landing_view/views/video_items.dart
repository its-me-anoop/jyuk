import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoItems extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  final bool autoplay;
  final bool fullScreen;
  final Duration thumbnailDuration;

  const VideoItems({
    required this.videoPlayerController,
    required this.looping,
    required this.autoplay,
    required this.fullScreen,
    required this.thumbnailDuration,
    Key? key,
  }) : super(key: key);

  @override
  _VideoItemsState createState() => _VideoItemsState();
}

class _VideoItemsState extends State<VideoItems> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16 / 9,
      startAt: widget.thumbnailDuration,
      autoInitialize: true,
      fullScreenByDefault: widget.fullScreen,
      autoPlay: widget.autoplay,
      looping: widget.looping,
      showControlsOnInitialize: false,
      deviceOrientationsOnEnterFullScreen: [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight
      ],
      systemOverlaysOnEnterFullScreen: [
        SystemUiOverlay.top,
        SystemUiOverlay.bottom
      ],
      deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
      showControls: true,
      showOptions: false,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
    _chewieController.setVolume(0.0);
    _chewieController.autoInitialize;
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: _chewieController,
    );
  }
}

///

