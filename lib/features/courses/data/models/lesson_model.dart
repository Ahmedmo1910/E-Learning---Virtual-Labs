class LessonModel {
  final String subject;
  final String title;
  final String description;
  final String? url;
  final List attachments;

  LessonModel({
    required this.subject,
    required this.title,
    required this.description,
    required this.attachments,
    this.url,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      subject: json['subject'],
      title: json['lessontitle'],
      description: json['description'],
      attachments: json['attachments'] ?? [],
    );
  }
  
}
