abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String errorMsg;
  AuthFailure(this.errorMsg);
}

// Reset Password Flow States
class OtpSent extends AuthState {}

class OtpVerified extends AuthState {
  final String resetToken;
  OtpVerified(this.resetToken);
}

class PasswordResetSuccess extends AuthState {}
