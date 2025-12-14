import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/attendance_repo.dart';
part 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  final AttendanceRepo _attendanceRepo = AttendanceRepo();
  AttendanceCubit() : super(AttendanceInitial());

  Future<void> getAttendance() async {
    emit(AttendanceLoading());

    final response = await _attendanceRepo.getAttendance();

    if (response is Map && response["statusCode"] == 200) {
      emit(AttendanceLoaded(response['value']));
    } else {
      emit(AttendanceFailed(response.toString()));
    }
  }
}
