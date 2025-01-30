import 'package:authentication/common/widgets/login_signup/form_divider.dart';
import 'package:authentication/common/widgets/login_signup/form_footer.dart';
import 'package:authentication/utils/constants/sizes.dart';
import 'package:authentication/utils/constants/text_strings.dart';
import 'package:authentication/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = WNHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: WNSizes.appBarHeight, left: WNSizes.defaultSpace, right: WNSizes.defaultSpace, bottom: WNSizes.defaultSpace),
          child: Column(
            children: [
              ///Header with Logo, logo header, logo sub header
              const WNLoginHeader(),

              ///Form
              const WNLoginForm(),

              ///Divider
              WNLoginDivider(dividerText: WNTexts.orSignInWith.capitalize!,),

              const SizedBox(height: WNSizes.spaceBtwSections,),

              ///Footer
              WNLoginFooter(),

            ],
          ),
        ),
      ),
    );
  }
}








