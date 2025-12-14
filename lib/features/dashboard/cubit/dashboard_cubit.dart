import 'package:bloc/bloc.dart';
import '../data/dashboard_repo.dart';
part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepo _dashboardRepo = DashboardRepo();
  DashboardCubit() : super(DashboardInitial());

  Future<void> getDashboard() async {
    emit((DashboardLoading()));
    final response = await _dashboardRepo.getDashboard();
    if (response is Map && response['statusCode'] == 200) {
      emit(DashboardLoaded(dashboardData: response));
    } else {
      emit(DashboardFailed(response.toString()));
    }
  }
}
