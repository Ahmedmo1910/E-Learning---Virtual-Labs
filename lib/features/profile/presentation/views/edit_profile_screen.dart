import 'package:e_learning/features/profile/presentation/views/edit_profile_screen_body.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final String fullName;
  final String email;
  final String phone;

  const EditProfileScreen({
    super.key,
    required this.fullName,
    required this.email,
    required this.phone,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile")),
      body: EditProfileScreenBody(
        context: context,
        fullName: widget.fullName,
        email: widget.email,
        phone: widget.phone,
      ),
    );
  }
}
