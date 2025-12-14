part of 'grades_cubit.dart';

sealed class GradesState {}

final class GradesInitial extends GradesState {}

final class GradesLoading extends GradesState {}

final class GradesLoaded extends GradesState {
  final List<dynamic> grades;
  GradesLoaded(this.grades);
}

final class GradesFailed extends GradesState {
  final String errorMsg;
  GradesFailed(this.errorMsg);
}
