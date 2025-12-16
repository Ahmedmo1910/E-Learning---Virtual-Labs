import 'package:dio/dio.dart';
import 'package:e_learning/core/services/dio_client.dart';
import 'package:e_learning/generated/l10n.dart';

class AttendanceRepo {
  final DioClient _dioClient = DioClient();
  Future<dynamic> getAttendance() async {
    try {
      final response = await _dioClient.dio.get(
        "/api/v1/student/my-attendance",
      );
      return response.data;
    } on DioException catch (e) {
      return e.response?.data["message"] ?? S.current.failedToGetAttendance;
    }
  }
}
