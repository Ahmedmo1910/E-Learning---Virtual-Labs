import 'package:dio/dio.dart';
import 'package:e_learning/core/services/api_pref_helper.dart';
import 'package:e_learning/core/services/dio_client.dart';


class AuthRepo {
  final DioClient _dioClient = DioClient();
  Future<dynamic> register({
    required String fullName,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    try {
      final responce = await _dioClient.dio.post(
        '/api/Auth/register',
        data: {
          'fullName': fullName,
          'email': email,
          'password': password,
          'phoneNumber': phoneNumber,
        },
      );
      return responce.data;
    } on DioException catch (e) {
      return {
        "success": false,
        "message": e.response?.data['message'] ?? 'Registeration Faild',
      };
    }
  }

  Future<dynamic> verifyEmail({
    required String email,
    required String otp,
  }) async {
    try {
      final responce = await _dioClient.dio.post(
        '/api/Auth/email/verify',
        data: {'email': email, 'otp': otp},
      );
      return responce.data;
    } on DioException catch (e) {
      return {
        "success": false,
        "message": e.response?.data['message'] ?? 'otp is incorrect',
      };
    }
  }

  Future<dynamic> login({
    required String password,
    required String email,
  }) async {
    try {
      final responce = await _dioClient.dio.post(
        '/api/Auth/login',
        data: {'email': email, 'password': password},
      );
      final data = responce.data;
      if (data['success'] == true && data['auth'] != null) {
        final token = data['auth']['token'];
        if (token != null) {
          await ApiPrefHelper.saveToken(token);
        }
      }
      return data;
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        return {
          "success": false,
          "message": e.response?.data['message'] ?? 'something went wromg',
        };
      }
      return {"success": false, "message": 'Check your internet connection'};
    }
  }

  Future<dynamic> logout() async {
    try {
      final responce = await _dioClient.dio.post('/api/Auth/logout');
      return responce.data;
    } on DioException catch (e) {
      return {
        "success": false,
        "message": e.response?.data['message'] ?? 'Logout faild',
      };
    }
  }
}
