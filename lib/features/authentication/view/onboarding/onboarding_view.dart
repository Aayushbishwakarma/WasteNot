import 'package:authentication/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:authentication/utils/constants/image_strings.dart';
import 'package:authentication/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/onboarding_circbtn.dart';
import 'widgets/onboarding_nav.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip.dart';


class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          ///Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: WNImages.onBoardingImage1,
                heading: WNTexts.onBoardingTitle1,
                subheading: WNTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: WNImages.onBoardingImage2,
                heading: WNTexts.onBoardingTitle2,
                subheading: WNTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: WNImages.onBoardingImage3,
                heading: WNTexts.onBoardingTitle3,
                subheading: WNTexts.onBoardingSubTitle3,
              )
            ],

          ),

          /// Skip Button
          const OnboardingSkip(),

          ///Dot Navigation SmoothPage Indicator
          OnBoardingNav(),

          ///Circular Button
          OnBoardingCircBtn(),
          



        ],
      )
    );
  }
}








