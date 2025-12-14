import 'package:e_learning/core/helper_functions/secure_storage.dart';
import 'package:e_learning/features/home/data/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo = HomeRepo();
  HomeCubit() : super(HomeState());

  Future<void> getAllData({bool refresh = false, int day = 1}) async {
    try {
      final cachedProfile = await SecureStorage.getProfile();

      if (cachedProfile != null && !refresh) {
        emit(state.copyWith(loading: false, profile: cachedProfile));
      } else {
        emit(state.copyWith(loading: true));
      }

      final profile = await _homeRepo.getProfile();
      final notifications = await _homeRepo.getNotifications();
      final lessons = await _homeRepo.getLessons();
      final schedule = await _homeRepo.getSchedule(day);

      await SecureStorage.saveProfile(profile);

      emit(
        state.copyWith(
          loading: true,
          profile: profile,
          notifications: notifications,
          lessons: lessons,
          schedule: schedule,
        ),
      );
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }
}
