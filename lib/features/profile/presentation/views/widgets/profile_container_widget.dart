import 'package:e_learning/core/utils/app_colors.dart';
import 'package:e_learning/core/utils/app_text_styles.dart';
import 'package:e_learning/core/widgets/language_selector.dart';
import 'package:e_learning/features/attendence/attendence_screen.dart';
import 'package:e_learning/features/dashboard/dash_board_screen.dart';
import 'package:e_learning/features/grades/grades_screen.dart';
import 'package:e_learning/features/profile/presentation/views/edit_profile_screen.dart';
import 'package:e_learning/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/profile_cubit/profile_cubit.dart';
import 'custom_list_tile_widget.dart';

class ProfileContainerWidget extends StatelessWidget {
  final Map<String, dynamic> profile;
  const ProfileContainerWidget({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.only(top: 70),
            child: Column(
              children: [
                Text(
                  profile['fullname'] ?? 'Full Name',
                  style: AppTextStyles.semiBold24.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  profile['email'] ?? 'Email',
                  style: AppTextStyles.medium18.copyWith(
                    color: AppColors.greyColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  profile['phone'] ?? 'Phone',
                  style: AppTextStyles.medium18.copyWith(
                    color: AppColors.greyColor,
                  ),
                ),
                const SizedBox(height: 35),
                CustomListTileWidget(
                  title: S.of(context).editProfile,
                  leadingIcon: Icons.edit_outlined,
                  onTap: () async {
                    final result = await Navigator.pushNamed(
                      context,
                      EditProfileScreen.routeName,
                      arguments: profile,
                    );
                    if (result == true) {
                      context.read<ProfileCubit>().getProfile(refresh: true);
                    }
                  },
                ),
                CustomListTileWidget(
                  title: S.of(context).dashboard,
                  leadingIcon: Icons.dashboard_customize,
                  onTap: () {
                    Navigator.pushNamed(context, DashboardScreen.routeName);
                  },
                ),
                CustomListTileWidget(
                  title: S.of(context).grades,
                  leadingIcon: Icons.my_library_books,
                  onTap: () async {
                    Navigator.pushNamed(context, GradesScreen.routeName);
                  },
                ),
                CustomListTileWidget(
                  title: S.of(context).attendence,
                  leadingIcon: Icons.assessment,
                  onTap: () async {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AttendenceScreen(),
                      ),
                    );
                  },
                ),
                CustomListTileWidget(
                  title: S.of(context).privacyPolicy,
                  leadingIcon: Icons.lock_outline,
                  onTap: () {},
                ),
                LanguageSelectorTile(),
                CustomListTileWidget(
                  title: S.of(context).signOut,
                  leadingIcon: Icons.logout,
                  isSignOut: true,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return AlertDialog(
                          title: Text(
                            S.of(context).signOut,
                            style: AppTextStyles.semiBold18.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          content: Text(
                            S.of(context).signOutConfirmation,
                            style: AppTextStyles.regular14,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(dialogContext),
                              child: Text(
                                S.of(context).cancel,
                                style: AppTextStyles.regular14.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(dialogContext);
                                context.read<ProfileCubit>().logout();
                              },
                              child: Text(
                                S.of(context).signOut,
                                style: AppTextStyles.regular14.copyWith(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          const Positioned(
            top: -50,
            child: CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage("assets/images/on_boarding1.png"),
            ),
          ),
        ],
      ),
    );
  }
}
