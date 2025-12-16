import 'package:dio/dio.dart';
import 'package:e_learning/core/services/dio_client.dart';
import 'package:e_learning/generated/l10n.dart';

class StudentsRepo {
  final DioClient _dioClient = DioClient();

  Future<dynamic> getDashboard() async {
    try {
      final responce = await _dioClient.dio.get('/api/v1/student/dashboard');
      return responce.data;
    } on DioException catch (e) {
      return e.response?.data['message'] ?? S.current.failedToGetDashboard;
    }
  }

  Future<dynamic> getGrades() async {
    try {
      final responce = await _dioClient.dio.get("/api/v1/student/my-grades");
      return responce.data;
    } on DioException catch (e) {
      return e.response?.data["message"] ?? S.current.failedToGetGrades;
    }
  }

  Future<dynamic> getAttendance() async {
    try {
      final responce = await _dioClient.dio.get(
        "/api/v1/student/my-attendance",
      );
      return responce.data;
    } on DioException catch (e) {
      return e.response?.data["message"] ??S.current.failedToGetAttendance;
    }
  }

  Future<dynamic> getLessons() async {
    try {
      final responce = await _dioClient.dio.get("/api/v1/student/my-lessons");
      return responce.data;
    } on DioException catch (e) {
      return e.response?.data["message"] ?? S.current.failedToGetLessons;
    }
  }

  Future<dynamic> getNotifications() async {
    try {
      final responce = await _dioClient.dio.get(
        "/api/v1/student/notifications",
      );
      return responce.data;
    } on DioException catch (e) {
      return e.response?.data["message"] ??S.current.failedToGetNotifications;
    }
  }

  Future<dynamic> getProfile() async {
    try {
      final responce = await _dioClient.dio.get("/api/v1/student/profile");
      return responce.data;
    } on DioException catch (e) {
      return e.response?.data["message"] ?? S.current.failedToGetProfile;
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
      return e.response?.data['message'] ??S.current.failedToUpdateProfile;
    }
  }
}
