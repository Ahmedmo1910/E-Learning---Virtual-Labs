import 'package:dio/dio.dart';
import 'package:e_learning/core/services/dio_client.dart';

class StudentsRepo {
  final DioClient _dioClient = DioClient();

  Future<dynamic> getDashboard() async {
    try {
      final responce = await _dioClient.dio.get('/api/v1/student/dashboard');
      return responce.data;
    } on DioException catch (e) {
      return e.response?.data['message'] ?? 'faild to get Dashboard';
    }
  }

  Future<dynamic> getGrades() async {
    try {
      final responce = await _dioClient.dio.get("/api/v1/student/my-grades");
      return responce.data;
    } on DioException catch (e) {
      return e.response?.data["message"] ?? 'faild to get Grades';
    }
  }

  Future<dynamic> getAttendance() async {
    try {
      final responce = await _dioClient.dio.get(
        "/api/v1/student/my-attendance",
      );
      return responce.data;
    } on DioException catch (e) {
      return e.response?.data["message"] ?? 'faild to get Attendance';
    }
  }

  Future<dynamic> getLessons() async {
    try {
      final responce = await _dioClient.dio.get("/api/v1/student/my-lessons");
      return responce.data;
    } on DioException catch (e) {
      return e.response?.data["message"] ?? 'faild to get Lessons';
    }
  }

  Future<dynamic> getNotifications() async {
    try {
      final responce = await _dioClient.dio.get(
        "/api/v1/student/notifications",
      );
      return responce.data;
    } on DioException catch (e) {
      return e.response?.data["message"] ?? 'faild to receive Notifications';
    }
  }

  Future<dynamic> getProfile() async {
    try {
      final responce = await _dioClient.dio.get("/api/v1/student/profile");
      return responce.data;
    } on DioException catch (e) {
      return e.response?.data["message"] ?? 'faild to get Profile';
    }
  }

  Future<dynamic> updateProfile({
    required String fullname,
    required String phonenumber,
  }) async {
    try {
      final responce = await _dioClient.dio.put(
        '/api/v1/student/profile',
        data: {'fullname': fullname, 'phonenumber': phonenumber},
      );
      return responce.data;
    } on DioException catch (e) {
      return e.response?.data['message'] ?? 'faild to updata profile';
    }
  }
}
