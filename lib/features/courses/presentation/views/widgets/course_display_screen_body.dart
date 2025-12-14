import 'package:e_learning/core/utils/app_text_styles.dart';
import 'package:e_learning/features/courses/data/models/lesson_model.dart';
import 'package:flutter/material.dart';
import 'course_info.dart';
import 'exam_attachment_card.dart';
import 'video_player_widget.dart';

class CourseDisplayScreenBody extends StatelessWidget {
  final LessonModel lesson;
  final int index;
  const CourseDisplayScreenBody({
    super.key,
    required this.lesson,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> videos = [
      'https://www.bing.com/videos/riverview/relatedvideo?q=%d9%81%d9%8a%d8%af%d9%8a%d9%88%d9%87%d8%a7%d8%aa+%d8%aa%d8%b9%d9%84%d9%8a%d9%85%d9%8a%d8%a9+%d9%84%d9%84%d8%a7%d8%b7%d9%81%d8%a7%d9%84&&mid=26049C8C7F6DD5FEF83126049C8C7F6DD5FEF831&FORM=VCGVRP', // Lesson 0
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4', // Lesson 1
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4', // Lesson 2
    ];
    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VideoPlayerWidget(videoUrl: videos[index]),
          SizedBox(height: 20),
          CourseInfo(subject: lesson.title, lessonTitle: lesson.description),
          Divider(color: Color(0xFFDEDEDE), thickness: 1),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('All Exams :', style: AppTextStyles.semiBold20),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: lesson.attachments.length,
              itemBuilder: (context, index) {
                final attachment = lesson.attachments[index];

                return ExamAttachmentCard(
                  title: attachment['attachmenttitle'],
                  description: attachment['attachmentdescription'],
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
