import 'package:authentication/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:authentication/utils/constants/colors.dart';
import 'package:authentication/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class OnBoardingNav extends StatelessWidget {
  const OnBoardingNav({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = WNHelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: 145,
        left: 160,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: ExpandingDotsEffect(activeDotColor: dark? WNColors.light: WNColors.dark, dotHeight: 6),
        ),
    );
  }
}