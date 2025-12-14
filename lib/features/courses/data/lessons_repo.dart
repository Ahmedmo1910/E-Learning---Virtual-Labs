import 'package:dio/dio.dart';
import 'package:e_learning/core/services/dio_client.dart';

class LessonsRepo {
  final DioClient _dioClient = DioClient();
  Future<dynamic> getLessons() async {
    try {
      final response = await _dioClient.dio.get("/api/v1/student/my-lessons");
      return response.data;
    } on DioException catch (e) {
      return e.response?.data["message"] ?? 'Failed to get Lessons';
    }
  }
}
