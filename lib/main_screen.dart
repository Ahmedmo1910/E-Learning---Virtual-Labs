import 'package:e_learning/core/utils/app_colors.dart';
import 'package:e_learning/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'features/courses/presentation/views/courses_screen_body.dart';
import 'features/profile/presentation/views/widgets/profile_screen_body.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const String routeName = 'main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        controller: _controller,
        tabs: [
          PersistentTabConfig(
            screen: const Center(child: Text("Home Screen")),
            item: ItemConfig(
              icon: const Icon(Icons.home),
              title: "Home",
              textStyle: AppTextStyles.medium12,
              activeForegroundColor: AppColors.primaryColor,
            ),
          ),
          PersistentTabConfig(
            screen:CoursesScreenBody(),
            item: ItemConfig(
              icon: const Icon(Icons.menu_book),
              title: "Courses",
              textStyle: AppTextStyles.medium12,
              activeForegroundColor: AppColors.primaryColor,
            ),
          ),
          PersistentTabConfig(
            screen:ProfileScreenBody(),
            item: ItemConfig(
              icon: const Icon(Icons.person),
              title: "Profile",
              textStyle: AppTextStyles.medium12,
              activeForegroundColor: AppColors.primaryColor,
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) =>
            Style6BottomNavBar(navBarConfig: navBarConfig),
      ),
    );
  }
}
