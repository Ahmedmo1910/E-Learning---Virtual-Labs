part of 'attendance_cubit.dart';

sealed class AttendanceState {}

final class AttendanceInitial extends AttendanceState {}

final class AttendanceLoading extends AttendanceState {}

final class AttendanceLoaded extends AttendanceState {
  final List<dynamic> attendance;
  AttendanceLoaded(this.attendance);
}

final class AttendanceFailed extends AttendanceState {
  final String errorMsg;
  AttendanceFailed(this.errorMsg);
}
