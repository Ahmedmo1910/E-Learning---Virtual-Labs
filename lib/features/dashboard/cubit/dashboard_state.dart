part of 'dashboard_cubit.dart';

sealed class DashboardState {}

final class DashboardInitial extends DashboardState {}

final class DashboardLoading extends DashboardState {}

final class DashboardLoaded extends DashboardState {
  final Map<dynamic, dynamic> dashboardData;
  DashboardLoaded({required this.dashboardData});
}

final class DashboardFailed extends DashboardState {
  final String errorMsg;
  DashboardFailed(this.errorMsg);
}
