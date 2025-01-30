import 'package:authentication/features/authentication/view/signup/verify_email.dart';
import 'package:authentication/features/authentication/view/signup/widgets/terms_condition_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart%20';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class WNsignupform extends StatelessWidget {
  const WNsignupform({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                expands:false,
                decoration:  InputDecoration(
                    labelText: WNTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium

                ),
              ),
            ),
            const SizedBox(width:  WNSizes.spaceBtwInputFields,),
            Expanded(
              child: TextFormField(
                expands:false,
                decoration: InputDecoration(
                    labelText: WNTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium

                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: WNSizes.spaceBtwInputFields,),
        ///Username
        TextFormField(
          expands: false,
          decoration:  InputDecoration(
              labelText: WNTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              floatingLabelStyle: Theme.of(context).textTheme.bodyMedium
          ),
        ),
        const SizedBox(height: WNSizes.spaceBtwInputFields,),
        ///Email
        TextFormField(
          expands: false,
          decoration:  InputDecoration(labelText: WNTexts.email,
              prefixIcon: Icon(Iconsax.direct),
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              floatingLabelStyle: Theme.of(context).textTheme.bodyMedium
          ),
        ),
        const SizedBox(height: WNSizes.spaceBtwInputFields,),
        ///PhoneNumber
        TextFormField(
          expands: false,
          decoration:  InputDecoration(labelText: WNTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              floatingLabelStyle: Theme.of(context).textTheme.bodyMedium
          ),
        ),
        const SizedBox(height: WNSizes.spaceBtwInputFields,),
        ///Password
        TextFormField(
          obscureText: true,
          decoration:  InputDecoration(
              labelText: WNTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              floatingLabelStyle: Theme.of(context).textTheme.bodyMedium
          ),
        ),
        const SizedBox(height: WNSizes.spaceBtwInputFields,),
        ///Address
        TextFormField(
          expands: false,
          decoration:  InputDecoration(
              labelText: WNTexts.address,
              prefixIcon: Icon(Iconsax.location),
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              floatingLabelStyle: Theme.of(context).textTheme.bodyMedium
          ),
        ),
        const SizedBox(height: WNSizes.spaceBtwInputFields,),
        ///Termconditions Checkbox
        WNTermsAndConditioncheckbox(),
        const SizedBox(height: WNSizes.spaceBtwInputFields,),

        /// Sign Up Button
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(()=> const VerifyEmailView()), child: const Text(WNTexts.createAccount),)
        )],
    ),
    );
  }
}


