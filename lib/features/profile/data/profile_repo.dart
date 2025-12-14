import 'package:dio/dio.dart';
import 'package:e_learning/core/services/dio_client.dart';
import 'package:e_learning/generated/l10n.dart';

class ProfileRepo {
  final DioClient _dioClient = DioClient();
  Future<dynamic> getProfile() async {
    try {
      final response = await _dioClient.dio.get("/api/v1/student/profile");
      return response.data;
    } on DioException catch (e) {
      return e.response?.data["message"] ??S.current.failedToGetProfile;
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
      return e.response?.data['message'] ??  S.current.failedToUpdateProfile;
    }
  }

  Future<dynamic> logout() async {
    try {
      final response = await _dioClient.dio.post('/api/Auth/logout');
      return response.data;
    } on DioException catch (e) {
      return {
        "success": false,
        "message": e.response?.data['message'] ?? S.current.logoutFailed,
      };
    }
  }
}
