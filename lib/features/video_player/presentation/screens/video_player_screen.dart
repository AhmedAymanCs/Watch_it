import 'package:flutter/material.dart';
import 'package:watch_it/core/constants/app_colors.dart';
import 'package:watch_it/core/constants/app_style.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoId;
  final String title;

  const VideoPlayerScreen({
    super.key,
    required this.videoId,
    required this.title,
  });

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen>
    with AutomaticKeepAliveClientMixin {
  late final YoutubePlayerController _controller;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    print(widget.videoId);
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        useHybridComposition: true,
        enableCaption: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: AppColors.primaryGreen,
      ),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackground,
          appBar: AppBar(
            backgroundColor: AppColors.primaryGreen,
            centerTitle: true,
            title: Text(widget.title, style: AppStyle.bold18),
            iconTheme: const IconThemeData(color: AppColors.textWhite),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              player,
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.title,
                  textAlign: TextAlign.left,
                  style: AppStyle.bold20,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
