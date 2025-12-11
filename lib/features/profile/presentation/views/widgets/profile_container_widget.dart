import 'package:e_learning/core/utils/app_colors.dart';
import 'package:e_learning/core/utils/app_text_styles.dart';
import 'package:e_learning/features/profile/presentation/views/edit_profile_screen.dart';
import 'package:e_learning/features/profile/presentation/views/widgets/custom_list_tile_widget.dart';
import 'package:e_learning/features/students/data/cubit/student_cubit.dart';
import 'package:e_learning/features/students/data/cubit/student_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProfileContainerWidget extends StatelessWidget {
  const ProfileContainerWidget({super.key});

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
            padding: EdgeInsets.only(top: 70),
            child: BlocBuilder<StudentCubit, StudentState>(
              builder: (context, state) {
                String name = "Username";
                String email = "username@gmail.com";
                String phoneNumber = '01119572871';
                if (state is StudentLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is StudentFailure) {
                  return Center(
                    child: Text(
                      state.errorMsg,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }
                if (state is GetProfile) {
                  final data = state.data;
                  name = data["fullname"] ?? name;
                  email = data["email"] ?? email;
                  phoneNumber = data['phone'] ?? phoneNumber;
                }
                return RefreshIndicator(
                  onRefresh: () => context.read<StudentCubit>().getProfile(),
                  child: ListView(
                    children: [
                      Center(
                        child: Text(
                          name,
                          style: AppTextStyles.semiBold24.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      const Gap(4),
                      Center(
                        child: Text(
                          email,
                          style: AppTextStyles.medium18.copyWith(
                            color: AppColors.greyColor,
                          ),
                        ),
                      ),
                      const Gap(4),
                      Center(
                        child: Text(
                          phoneNumber,
                          style: AppTextStyles.medium18.copyWith(
                            color: AppColors.greyColor,
                          ),
                        ),
                      ),

                      const Gap(10),

                      CustomListTileWidget(
                        title: "Edit Profile",
                        leadingIcon: Icons.edit_outlined,
                        onTap: () async {
                          if (state is GetProfile) {
                            final refresh = await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => EditProfileScreen(
                                  fullName: name,
                                  email: email,
                                  phone: phoneNumber,
                                ),
                              ),
                            );
                            if (refresh == true) {
                              context.read<StudentCubit>().getProfile();
                            }
                          }
                        },
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
                        onTap: () {},
                      ),
                    ],
                  ),
                );
              },
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
