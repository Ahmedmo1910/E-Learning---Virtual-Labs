import 'package:e_learning/core/services/localization_provider.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
void setupGetIt() {
    getIt.registerLazySingleton<LocalizationProvider>(
        () => LocalizationProvider(),
  );
}
