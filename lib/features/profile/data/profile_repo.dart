import 'package:dio/dio.dart';
import 'package:e_learning/core/services/dio_client.dart';

class ProfileRepo {
  final DioClient _dioClient = DioClient();
  Future<dynamic> getProfile() async {
    try {
      final response = await _dioClient.dio.get("/api/v1/student/profile");
      return response.data;
    } on DioException catch (e) {
      return e.response?.data["message"] ?? 'Failed to get Profile';
    }
  }

  Future<dynamic> updateProfile({
    required String fullName,
    required String phoneNumber,
  }) async {
    try {
      final response = await _dioClient.dio.put(
        '/api/v1/student/profile',
        data: {'fullname': fullName, 'phonenumber': phoneNumber},
      );
      return response.data;
    } on DioException catch (e) {
      return e.response?.data['message'] ?? 'Failed to updata profile';
    }
  }
}
