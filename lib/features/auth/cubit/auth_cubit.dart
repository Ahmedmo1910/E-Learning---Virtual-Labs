import 'package:e_learning/core/services/api_pref_helper.dart';
import 'package:e_learning/features/auth/cubit/auth_state.dart';
import 'package:e_learning/features/auth/data/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;

  AuthCubit(this._authRepo) : super(AuthInitial());
  //  register

  Future<void> register({
    required String fullName,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    emit(AuthLoading());
    final responce = await _authRepo.register(
      fullName: fullName,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
    );
    if (responce["success"] == true) {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure(responce['message'] ?? "Registeration failed"));
    }
  }

  //  verifyEmail

  Future<void> verifyEmail({required String email, required String otp}) async {
    emit(AuthLoading());
    final response = await _authRepo.verifyEmail(email: email, otp: otp);
    if (response["success"] == true) {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure(response['message'] ?? "verification failed"));
    }
  }

  //  login
  
  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    final response = await _authRepo.login(password: password, email: email);
    if (response["success"] == true && response["auth"] != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure(response["message"] ?? "Login failed please try again"));
    }
  }

  //  sendResetOtp

  Future<void> sendResetOtp({required String email}) async {
    emit(AuthLoading());
    final response = await _authRepo.sendResetOtp(email: email);
    if (response["success"] == true) {
      emit(OtpSent());
    } else {
      emit(AuthFailure(response["message"] ?? "Failed to send OTP"));
    }
  }

  //  verifyOtp

  Future<void> verifyOtp({required String email, required String otp}) async {
    emit(AuthLoading());
    final response = await _authRepo.verifyOtp(email: email, otp: otp);
    if (response["success"] == true) {
      emit(OtpVerified(response['resettoken']));
    } else {
      emit(AuthFailure(response["message"] ?? "OTP incorrect"));
    }
  }

  //  RESET PASSWORD

  Future<void> resetPassword({
    required String email,
    required String newpassword,
    required String resetToken,
  }) async {
    emit(AuthLoading());
    final response = await _authRepo.resetPassword(
      email: email,
      newPassword: newpassword,
      resetToken: resetToken,
    );
    if (response["success"] == true) {
      emit(PasswordResetSuccess());
    } else {
      emit(AuthFailure(response["message"] ?? "Resetting password failed"));
    }
  }

  // LOGOUT

  Future<void> logout() async {
    emit(AuthLoading());
    final responce = await _authRepo.logout();
    if (responce['success'] == true) {
      await ApiPrefHelper.removeToken();
      emit(AuthSuccess());
    } else {
      emit(AuthFailure(responce["message"] ?? "Logout failed"));
    }
  }
}
