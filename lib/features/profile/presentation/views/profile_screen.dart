import 'package:e_learning/features/profile/presentation/views/widgets/profile_screen_body.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const String routeName = 'profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProfileScreenBody());
  }
}
