part of 'home_cubit.dart';

class HomeState {
  final bool loading;
  final Map<String, dynamic>? profile;
  final List<dynamic>? notifications;
  final List<dynamic>? lessons;
  final List<dynamic>? schedule;
  final List<dynamic>? quickAccess;
  final String? error;

  HomeState({
    this.loading = false,
    this.profile,
    this.notifications,
    this.lessons,
    this.schedule,
    this.quickAccess,
    this.error,
  });

  HomeState copyWith({
    bool? loading,
    Map<String, dynamic>? profile,
    List<dynamic>? notifications,
    List<dynamic>? lessons,
    List<dynamic>? schedule,
    List<dynamic>? quickAccess,
    String? error,
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      profile: profile ?? this.profile,
      notifications: notifications ?? this.notifications,
      lessons: lessons ?? this.lessons,
      schedule: schedule ?? this.schedule,
      quickAccess: quickAccess ?? this.quickAccess,
      error: error ?? this.error,
    );
  }
}
