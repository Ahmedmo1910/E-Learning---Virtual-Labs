import 'package:dio/dio.dart';
import 'package:e_learning/core/services/dio_client.dart';

class DashboardRepo {
  final DioClient _dioClient = DioClient();

  Future<dynamic> getDashboard() async {
    try {
      final response = await _dioClient.dio.get('/api/v1/student/dashboard');
      return response.data;
    } on DioException catch (e) {
      return e.response?.data['message'] ?? 'Failed to get Dashboard';
    }
  }
}
