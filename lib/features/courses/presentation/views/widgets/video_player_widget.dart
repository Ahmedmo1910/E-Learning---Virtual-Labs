import 'package:e_learning/core/utils/app_colors.dart';
import 'package:e_learning/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  const VideoPlayerWidget({super.key, required this.videoUrl});

  @override
  State<VideoPlayerWidget> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    );

    await _videoPlayerController.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: _videoPlayerController.value.aspectRatio,
      autoPlay: false,
      looping: false,
      allowFullScreen: true,
      allowMuting: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: AppColors.handleColor,
        handleColor: AppColors.handleColor,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.white60,
      ),
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(errorMessage, style: const TextStyle(color: Colors.red)),
        );
      },
    );

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Center(child: Text(S.of(context).loadingVideo)),
          )
        : AspectRatio(
            aspectRatio: _videoPlayerController.value.aspectRatio,
            child: Chewie(controller: _chewieController!),
          );
  }
}
