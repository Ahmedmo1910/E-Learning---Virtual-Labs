import 'package:e_learning/core/utils/app_colors.dart';
import 'package:e_learning/core/utils/app_text_styles.dart';
import 'package:e_learning/features/auth/cubit/auth_cubit.dart';
import 'package:e_learning/features/auth/cubit/auth_state.dart';
import 'package:e_learning/features/auth/presentation/auth_ui_actions.dart';
import 'package:e_learning/features/profile/presentation/views/widgets/custom_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileContainerWidget extends StatelessWidget {
  const ProfileContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthCubit>();
    final state = auth.state;
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
                  onTap: state is AuthLoading
                      ? null
                      : () async {
                          await AuthUiActions.signOut(context: context);
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
