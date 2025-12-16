import 'package:e_learning/core/utils/app_colors.dart';
import 'package:e_learning/core/utils/app_text_styles.dart';
import 'package:e_learning/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: PageView(
        controller: pageController,
        children: [
          PageViewItem(
            image: 'assets/images/on_boarding1.png',
            subtitle: S.of(context).onBoardingSubtitle1,
            title: Text(
              S.of(context).onBoardingTitle1,
              style: AppTextStyles.semiBold36.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
          PageViewItem(
            image: 'assets/images/on_boarding2.png',
            subtitle: S.of(context).onBoardingSubtitle2,
            title: Text(
              S.of(context).onBoardingTitle2,
              style: AppTextStyles.semiBold36.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
          PageViewItem(
            image: 'assets/images/on_boarding3.png',
            subtitle: S.of(context).onBoardingSubtitle3,
            title: Text(
              S.of(context).onBoardingTitle3,
              style: AppTextStyles.semiBold36.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
