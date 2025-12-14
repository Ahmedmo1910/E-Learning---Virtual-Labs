import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/grades_repo.dart';

part 'grades_state.dart';

class GradesCubit extends Cubit<GradesState> {
  final GradesRepo _gradesRepo = GradesRepo();
  GradesCubit() : super(GradesInitial());

  Future<void> getGrades() async {
    emit(GradesLoading());

    final response = await _gradesRepo.getGrades();

    if (response is Map && response["statusCode"] == 200) {
      emit(GradesLoaded(response['value']));
    } else {
      emit(GradesFailed(response.toString()));
    }
  }
}
