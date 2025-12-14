import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning/features/profile/data/profile_repo.dart';
import 'package:e_learning/core/helper_functions/secure_storage.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _repo = ProfileRepo();

  ProfileCubit() : super(ProfileInitial());

  Future<void> getProfile({bool refresh = false}) async {
    emit(ProfileLoading());

    try {
      final localProfile = await SecureStorage.getProfile();

      if (localProfile != null && !refresh) {
        emit(ProfileLoaded(localProfile));
      }

      final profileData = await _repo.getProfile();

      if (profileData is Map<String, dynamic>) {
        await SecureStorage.saveProfile(profileData);
        emit(ProfileLoaded(profileData));
      } else {
        emit(ProfileFailure(profileData.toString()));
      }
    } catch (e) {
      emit(ProfileFailure(e.toString()));
    }
  }

  Future<void> updateProfile({
    required String fullName,
    required String phoneNumber,
  }) async {
    emit(ProfileLoading());
    final response = await _repo.updateProfile(
      fullName: fullName,
      phoneNumber: phoneNumber,
    );
    if (response is Map && response["statusCode"] == 200) {
      emit(ProfileUpdated());
    } else {
      emit(ProfileFailure(response.toString()));
    }
  }

  void loadInitialProfile(Map profile) {
    emit(ProfileLoaded(profile as Map<String, dynamic>));
  }

  Future<void> logout() async {
    emit(ProfileLoading());

    try {
      final response = await _repo.logout();

      await SecureStorage.logout();
      await SecureStorage.clearProfile();

      if (response is Map && response['statusCode'] == 200) {
        emit(ProfileLogout());
      } else {
        emit(ProfileLogout());
      }
    } catch (e) {
      await SecureStorage.logout();
      await SecureStorage.clearProfile();
      emit(ProfileLogout());
    }
  }
}
