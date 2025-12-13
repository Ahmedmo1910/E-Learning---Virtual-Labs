import 'package:e_learning/core/utils/app_colors.dart';
import 'package:e_learning/core/utils/app_text_styles.dart';
import 'package:e_learning/features/attendence/attendence_screen.dart';
import 'package:e_learning/features/dashboard/dash_board_screen.dart';
import 'package:e_learning/features/grades/grades_screen.dart';
import 'package:e_learning/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:e_learning/features/profile/presentation/views/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../cubits/profile_cubit/profile_cubit.dart';
import 'custom_list_tile_widget.dart';

class ProfileContainerWidget extends StatelessWidget {
  const ProfileContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return Center(
            child: Lottie.asset(
              'assets/animations/loading.json',
              width: 250,
              height: 250,
            ),
          );
        }

        if (state is ProfileLoaded) {
          final profile = state.profile;

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
                        title: "Edit Profile",
                        leadingIcon: Icons.edit_outlined,
                        onTap: () async {
                          final result = await Navigator.pushNamed(
                            context,
                            EditProfileScreen.routeName,
                            arguments: state.profile,
                          );
                          if (result == true) {
                            context.read<ProfileCubit>().getProfile(
                              refresh: true,
                            );
                          }
                        },
                      ),
                      CustomListTileWidget(
                        title: "DashBoard",
                        leadingIcon: Icons.dashboard_customize,
                        onTap: () async {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DashboardScreen(),
                            ),
                          );
                        },
                      ),
                      CustomListTileWidget(
                        title: "Grades",
                        leadingIcon: Icons.my_library_books,
                        onTap: () async {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => GradesScreen(),
                            ),
                          );
                        },
                      ),
                      CustomListTileWidget(
                        title: "Attendence",
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
                    ],
                  ),
                ),
                const Positioned(
                  top: -50,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage(
                      "assets/images/on_boarding1.png",
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        if (state is ProfileFailure) {
          return Center(child: Text(state.errorMsg));
        }

        return const SizedBox.shrink();
      },
    );
  }
}
