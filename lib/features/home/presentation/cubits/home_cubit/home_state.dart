part of 'home_cubit.dart';

class HomeState {
  final bool loading;
  final Map<String, dynamic>? profile;
  final List<dynamic>? notifications;
  final List<dynamic>? stats;
  final List<dynamic>? quickAccess;
  final String? error;

  HomeState({
    this.loading = false,
    this.profile,
    this.notifications,
    this.stats,
    this.quickAccess,
    this.error,
  });

  HomeState copyWith({
    bool? loading,
    Map<String, dynamic>? profile,
    List<dynamic>? notifications,
    List<dynamic>? stats,
    List<dynamic>? quickAccess,
    String? error,
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      profile: profile ?? this.profile,
      notifications: notifications ?? this.notifications,
      stats: stats ?? this.stats,
      quickAccess: quickAccess ?? this.quickAccess,
      error: error ?? this.error,
    );
  }
}
