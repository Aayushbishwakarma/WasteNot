import 'package:authentication/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:authentication/utils/constants/sizes.dart';
import 'package:authentication/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingCircBtn extends StatelessWidget {
  const OnBoardingCircBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = WNHelperFunctions.isDarkMode(context);
    return Positioned(
        right: WNSizes.defaultSpace,
        bottom: kBottomNavigationBarHeight,
        child: ElevatedButton(
            onPressed: ()=> OnBoardingController.instance.nextPage(),
            style: ElevatedButton.styleFrom(shape: CircleBorder(), backgroundColor: dark? Colors.white70: Colors.black),
            child: Icon(Iconsax.arrow_right_3, color: dark? Colors.black: Colors.white))
    );
  }
}