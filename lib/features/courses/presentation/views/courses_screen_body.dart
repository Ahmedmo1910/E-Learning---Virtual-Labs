import 'package:e_learning/core/utils/app_colors.dart';
import 'package:e_learning/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class CoursesScreenBody extends StatefulWidget {
  const CoursesScreenBody({super.key});

  @override
  State<CoursesScreenBody> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<CoursesScreenBody> {
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
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      ),
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
        ? const Center(
            child: CircularProgressIndicator(color: AppColors.handleColor),
          )
        : Column(
            children: [
              const SizedBox(height: 60),
              AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: Chewie(controller: _chewieController!),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Introduction to Figma',
                          style: AppTextStyles.bold20,
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Instructor Name',
                          style: AppTextStyles.regular14.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 7),
                        RatingBar.builder(
                          initialRating: 4.5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemSize: 25.0,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.symmetric(
                            horizontal: 0.5,
                          ),
                          itemBuilder: (context, _) =>
                              const Icon(Icons.star, color: Color(0xFFFDCC0D)),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ],
                    ),
                    Spacer(),
                    Text('\$19.99', style: AppTextStyles.bold24),
                  ],
                ),
              ),
            ],
          );
  }
}
