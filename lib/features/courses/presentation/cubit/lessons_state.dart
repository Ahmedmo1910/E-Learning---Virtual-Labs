part of 'lessons_cubit.dart';

sealed class LessonsState {}

final class LessonsInitial extends LessonsState {}

final class LessonsLoading extends LessonsState {}

final class LessonsLoaded extends LessonsState {
  final List<LessonModel> lessons;

  LessonsLoaded(this.lessons);
}

final class LessonsFailure extends LessonsState {
  final String errorMsg;
  LessonsFailure(this.errorMsg);
}
