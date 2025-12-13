import 'package:equatable/equatable.dart';

abstract class StudentState extends Equatable {}

class StudentInitial extends StudentState {
  @override
  List<Object?> get props => [];
}

class StudentLoading extends StudentState {
  @override
  List<Object?> get props => [];
}

class StudentFailure extends StudentState {
  final String errorMsg;
  StudentFailure(this.errorMsg);
  @override
  List<Object?> get props => [errorMsg];
}

// ---------- GET DASHBOARD ----------
class GetDashboard extends StudentState {
  final dynamic data;
  GetDashboard(this.data);
  @override
  List<Object?> get props => [data];
}

// ---------- GET GRADES ----------
class GetGrades extends StudentState {
  final dynamic data;
  GetGrades(this.data);
  @override
  List<Object?> get props => [data];
}

// ---------- GET ATTENDANCE ----------
class GetAttendance extends StudentState {
  final dynamic data;
  GetAttendance(this.data);
  @override
  List<Object?> get props => [data];
}

// ---------- GET LESSONS ----------
class GetLessons extends StudentState {
  final dynamic data;
  GetLessons(this.data);
  @override
  List<Object?> get props => [data];
}

// ---------- GET NOTIFICATIONS ----------
class GetNotifications extends StudentState {
  final dynamic data;
  GetNotifications(this.data);
  @override
  List<Object?> get props => [data];
}

// ---------- GET PROFILE ----------
class GetProfile extends StudentState {
  final dynamic data;
  GetProfile(this.data);
  @override
  List<Object?> get props => [data];
}

class UpdateProfile extends StudentState {
  @override
  List<Object?> get props => [];
}
