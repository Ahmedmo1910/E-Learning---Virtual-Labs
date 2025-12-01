import 'package:e_learning/core/services/api_pref_helper.dart';
import 'package:e_learning/features/auth/data/auth_repo.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepo _authRepo = AuthRepo();
  bool isLoading = false;
  String? errorMsg;
  bool loginRuquiresOtp = false;
  void _startLoading() {
    isLoading = true;
    errorMsg = null;
    loginRuquiresOtp = false;
    notifyListeners();
  }

  void _stopLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future<bool> register({
    required String fullName,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    _startLoading();
    final response = await _authRepo.register(
      fullName: fullName,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
    );
    if (response["success"] == true) {
      _stopLoading();
      return true;
    } else {
      errorMsg = response['message'] ?? "Registeration failed";
      _stopLoading();
      return false;
    }
  }

  Future<bool> verifyEmail({required String email, required String otp}) async {
    _startLoading();
    final response = await _authRepo.verifyEmail(email: email, otp: otp);
    if (response["success"] == true) {
      _stopLoading();
      return true;
    } else {
      errorMsg = response['message'] ?? "verification failed";
      _stopLoading();
      return false;
    }
  }

  Future<bool> login({required String password, required String email}) async {
    _startLoading();
    final response = await _authRepo.login(password: password, email: email);
    if (response["success"] == true && response["auth"] != null) {
      _stopLoading();
      return true;
    } else if (response["verification"]?["requiresOtpVerification"] == true) {
      loginRuquiresOtp = true;
      _stopLoading();
      return false;
    } else {
      errorMsg = response["message"] ?? "Login failed please try again";
      loginRuquiresOtp = false;
      _stopLoading();
      return false;
    }
  }

  Future<bool> logout() async {
    _startLoading();
    final responce = await _authRepo.logout();
    if (responce['success'] == true) {
      await ApiPrefHelper.removeToken();
      _stopLoading();
      return true;
    } else {
      errorMsg = responce['message'] ?? 'Logout faild';
      _stopLoading();
      return false;
    }
  }

  Future<bool> sendResetOtp({required String email}) async {
    _startLoading();
    final responce = await _authRepo.sendResetOtp(email: email);
    _stopLoading();
    if (responce['success'] == true) {
      return true;
    } else {
      errorMsg = responce['message'];
      return false;
    }
  }

  Future<String?> verifyOtp({
    required String email,
    required String otp,
  }) async {
    _startLoading();
    final responce = await _authRepo.verifyOtp(email: email, otp: otp);
    _stopLoading();
    if (responce['success'] == true) {
      return responce['resettoken'];
    } else {
      errorMsg = responce['message'];
      return null;
    }
  }

  Future<bool> resetPassword({
    required String email,
    required String newpassword,
    required String resetToken,
  }) async {
    _startLoading();
    final responce = await _authRepo.resetPassword(
      email: email,
      newpassword: newpassword,
      resetToken: resetToken,
    );
    _stopLoading();
    if (responce['success'] == true) {
      return true;
    } else {
      errorMsg = responce['message'];
      return false;
    }
  }
}
