part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {
  final bool isLogout;
  ProfileLoading({this.isLogout = false});
}

final class ProfileLoaded extends ProfileState {
  final Map<String, dynamic> profile;
  ProfileLoaded(this.profile);
}

final class ProfileUpdated extends ProfileState {}

final class ProfileLogout extends ProfileState {}

final class ProfileFailure extends ProfileState {
  final String errorMsg;
  ProfileFailure(this.errorMsg);
}
