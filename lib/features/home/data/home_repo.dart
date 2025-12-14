import 'package:dio/dio.dart';
import 'package:e_learning/core/services/dio_client.dart';

class HomeRepo {
  final DioClient _dioClient = DioClient();
  Future<dynamic> getNotifications() async {
    try {
      final response = await _dioClient.dio.get(
        "/api/v1/student/notifications",
      );
      return response.data['value'];
    } on DioException catch (e) {
      return e.response?.data["message"] ?? 'Failed to receive Notifications';
    }
  }

  Future<dynamic> getProfile() async {
    try {
      final response = await _dioClient.dio.get("/api/v1/student/profile");
      return response.data;
    } on DioException catch (e) {
      return e.response?.data["message"] ?? 'Failed to get Profile';
    }
  }

  Future<dynamic> getLessons() async {
    try {
      final response = await _dioClient.dio.get("/api/v1/student/my-lessons");
      return response.data['value'];
    } on DioException catch (e) {
      return e.response?.data["message"] ?? 'Failed to get Lessons';
    }
  }

  Future<dynamic> getSchedule(int day) async {
    try {
      final response = await _dioClient.dio.get(
        "/api/v1/student/schedule-by-day",
        queryParameters: {'day': day},
      );
      print(response.data);
      return response.data['value'];
    } on DioException catch (e) {
      return e.response?.data["message"] ?? 'Failed to get Lessons';
    }
  }
}
