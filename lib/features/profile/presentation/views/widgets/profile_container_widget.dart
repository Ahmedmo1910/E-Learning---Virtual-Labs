import 'package:e_learning/core/utils/app_colors.dart';
import 'package:e_learning/core/utils/app_text_styles.dart';
import 'package:e_learning/core/widgets/snack_bar_helper.dart';
import 'package:e_learning/features/auth/data/auth_provider.dart';
import 'package:e_learning/features/auth/sign_in/presentation/views/signin_screen.dart';
import 'package:e_learning/features/profile/presentation/views/widgets/custom_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileContainerWidget extends StatelessWidget {
  const ProfileContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 70),
            child: Column(
              children: [
                Text(
                  "Username",
                  style: AppTextStyles.semiBold24.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "username@gmail.com",
                  style: AppTextStyles.medium18.copyWith(
                    color: AppColors.greyColor,
                  ),
                ),

                const SizedBox(height: 35),

                CustomListTileWidget(
                  title: "Edit Profile",
                  leadingIcon: Icons.edit_outlined,
                  onTap: () async {},
                ),
                CustomListTileWidget(
                  title: "Bookmarks",
                  leadingIcon: Icons.bookmark_border,
                  onTap: () async {},
                ),
                CustomListTileWidget(
                  title: "Write a Review",
                  leadingIcon: Icons.star_border,
                  onTap: () async {},
                ),
                CustomListTileWidget(
                  title: "Share App",
                  leadingIcon: Icons.share_outlined,
                  onTap: () async {},
                ),
                CustomListTileWidget(
                  title: "Privacy Policy",
                  leadingIcon: Icons.lock_outline,
                  onTap: () async {},
                ),
                CustomListTileWidget(
                  title: "Sign Out",
                  leadingIcon: Icons.logout,
                  isSignOut: true,
                  onTap: auth.isLoading
                      ? null
                      : () async {
                          final sucess = await auth.logout();

                          if (!context.mounted) return;

                          if (sucess) {
                            SnackBarHelper.showSnackBar(
                              context,
                              'Logged out successfully.',
                              Colors.green,
                            );
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SigninScreen(),
                              ),
                              (route) => false,
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  auth.errorMsg ?? "Logout failed",
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                ),
              ],
            ),
          ),

          Positioned(
            top: -50,
            child: CircleAvatar(
              radius: 55,
              child: Image.asset("assets/images/on_boarding1.png"),
            ),
          ),
        ],
      ),
    );
  }
}
