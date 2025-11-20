import 'package:e_learning/core/utils/app_colors.dart';
import 'package:e_learning/core/utils/app_text_styles.dart';
import 'package:e_learning/features/profile/presentation/views/widgets/custom_list_tile_widget.dart';
import 'package:flutter/material.dart';

class ProfileContainerWidget extends StatelessWidget {
  const ProfileContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70),
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
                    color: Color(0xffA0A0A0),
                  ),
                ),

                const SizedBox(height: 35),

                CustomListTileWidget(
                  title: "Edit Profile",
                  leadingIcon: Icons.edit_outlined,
                  onTap: () {},
                ),
                CustomListTileWidget(
                  title: "Bookmarks",
                  leadingIcon: Icons.bookmark_border,
                  onTap: () {},
                ),
                CustomListTileWidget(
                  title: "Write a Review",
                  leadingIcon: Icons.star_border,
                  onTap: () {},
                ),
                CustomListTileWidget(
                  title: "Share App",
                  leadingIcon: Icons.share_outlined,
                  onTap: () {},
                ),
                CustomListTileWidget(
                  title: "Privacy Policy",
                  leadingIcon: Icons.lock_outline,
                  onTap: () {},
                ),
                CustomListTileWidget(
                  title: "Sign Out",
                  leadingIcon: Icons.logout,
                  isSignOut: true,
                  onTap: () {},
                ),

                const SizedBox(height: 70),
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
