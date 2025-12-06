import 'package:e_learning/features/students/data/cubit/student_state.dart';
import 'package:e_learning/features/students/data/students_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentCubit extends Cubit<StudentState> {
  final StudentsRepo _studentsRepo = StudentsRepo();
  StudentCubit() : super(StudentInitial());
  Future<void> getDashboard() async {
    emit(StudentLoading());
    final response = await _studentsRepo.getDashboard();
    if (response is Map && response['statusCode'] == 200) {
      emit(GetDashboard(response));
    } else {
      emit(StudentFailure(response.toString()));
    }
  }

  Future<void> getGrades() async {
    emit(StudentLoading());

    final response = await _studentsRepo.getGrades();

    if (response is Map && response["statusCode"] == 200) {
      emit(GetGrades(response));
    } else {
      emit(StudentFailure(response.toString()));
    }
  }

  Future<void> getAttendance() async {
    emit(StudentLoading());

    final response = await _studentsRepo.getAttendance();

    if (response is Map && response["statusCode"] == 200) {
      emit(GetAttendance(response));
    } else {
      emit(StudentFailure(response.toString()));
    }
  }

  Future<void> getLessons() async {
    emit(StudentLoading());

    final response = await _studentsRepo.getLessons();

    if (response is Map && response["statusCode"] == 200) {
      emit(GetLessons(response['value']));
    } else {
      emit(StudentFailure(response.toString()));
    }
  }

  Future<void> getNotifications() async {
    emit(StudentLoading());

    final response = await _studentsRepo.getNotifications();

    if (response is Map && response["statusCode"] == 200) {
      emit(GetNotifications(response['value']));
    } else {
      emit(StudentFailure(response.toString()));
    }
  }

  Future<void> getProfile() async {
    emit(StudentLoading());

    final response = await _studentsRepo.getProfile();

    if (response is Map && response["statusCode"] == 200) {
      emit(GetProfile(response));
    } else {
      emit(StudentFailure(response.toString()));
    }
  }

  Future<void> updateProfile({
    required String fullname,
    required String phonenumber,
  }) async {
    emit(StudentLoading());
    final response = await _studentsRepo.updateProfile(
      fullname: fullname,
      phonenumber: phonenumber,
    );
    if (response is Map && response["statusCode"] == 200) {
      emit(UpdateProfile());
    } else {
      emit(StudentFailure(response.toString()));
    }
  }
}
