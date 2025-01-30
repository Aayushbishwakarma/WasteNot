import 'package:authentication/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:authentication/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: kToolbarHeight,right: WNSizes.defaultSpace,
        child: TextButton(onPressed:(){
          OnBoardingController.instance.skipPage();
        },
            child: const Text('Skip')));
  }
}