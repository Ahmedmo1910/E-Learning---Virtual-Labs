abstract class StudentState {}

class StudentInitial extends StudentState {}

class StudentLoading extends StudentState {}

class StudentFailure extends StudentState {
  final String errorMsg;
  StudentFailure(this.errorMsg);
}

// ---------- GET DASHBOARD ----------
class GetDashboard extends StudentState {
  final dynamic data;
  GetDashboard(this.data);
}

// ---------- GET GRADES ----------
class GetGrades extends StudentState {
  final dynamic data;
  GetGrades(this.data);
}

// ---------- GET ATTENDANCE ----------
class GetAttendance extends StudentState {
  final dynamic data;
  GetAttendance(this.data);
}

// ---------- GET LESSONS ----------
class GetLessons extends StudentState {
  final dynamic data;
  GetLessons(this.data);
}

// ---------- GET NOTIFICATIONS ----------
class GetNotifications extends StudentState {
  final dynamic data;
  GetNotifications(this.data);
}

// ---------- GET PROFILE ----------
class GetProfile extends StudentState {
  final dynamic data;
  GetProfile(this.data);
}

class UpdateProfile extends StudentState {
  final dynamic data;
  UpdateProfile(this.data);
}
