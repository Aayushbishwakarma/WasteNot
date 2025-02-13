import 'package:authentication/features/authentication/view/password_configuration/reset_password.dart';
import 'package:authentication/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/text_strings.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Padding(
          padding: EdgeInsets.all(WNSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Heading
            Text(WNTexts.forgetPasswordTitle, style:Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: WNSizes.spaceBtwItems,),
            Text(WNTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: WNSizes.spaceBtwSections * 2),



            ///Text field
            TextFormField(
              decoration: InputDecoration(
                  labelText: WNTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  floatingLabelStyle: Theme.of(context).textTheme.bodyMedium
              ),
            ),
            const SizedBox(height: WNSizes.spaceBtwSections * 2),



            ///Submit Button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.off(() => const ResetPassword()), child: const Text(WNTexts.submit)))
          ],
        ),
      ) ,
    );
  }
}


