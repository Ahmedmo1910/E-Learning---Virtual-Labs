import 'package:e_learning/core/services/custom_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/helper_functions/on_generate_routes.dart';
import 'core/services/shared_preferences_singleton.dart';
import 'features/splash/presentation/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await prefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Plus Jakarta Sans',
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      ),
      title: 'Smart Desk',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashScreen.routeName,
    );
  }
}
