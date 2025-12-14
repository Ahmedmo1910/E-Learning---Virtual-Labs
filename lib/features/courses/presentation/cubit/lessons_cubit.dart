import 'package:e_learning/features/courses/data/models/lesson_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/lessons_repo.dart';
part 'lessons_state.dart';

class LessonsCubit extends Cubit<LessonsState> {
  final LessonsRepo _lessonsRepo = LessonsRepo();
  LessonsCubit() : super(LessonsInitial());
  Future<void> getLessons() async {
    emit(LessonsLoading());

    final response = await _lessonsRepo.getLessons();

    if (response is Map && response["statusCode"] == 200) {
      final List<LessonModel> lessons = (response['value'] as List)
          .map((e) => LessonModel.fromJson(e))
          .toList();
      emit(LessonsLoaded(lessons));
    } else {
      emit(LessonsFailure(response.toString()));
    }
  }
}
