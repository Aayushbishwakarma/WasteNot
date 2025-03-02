
import 'package:authentication/features/authentication/view/login/login_view.dart';
import 'package:authentication/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body : SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(WNSizes.defaultSpace),
          child: Column(
            children: [
              ///Image
              Image(image: const AssetImage(WNImages.deliveredImageIllustration), width: WNHelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: WNSizes.spaceBtwSections,),

              ///Title and Subtitile
              Text(WNTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: WNSizes.spaceBtwItems,),
              Text(WNTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: WNSizes.spaceBtwSections),

              ///Buttons
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=> Get.to(LoginView()),
                  child: const Text(WNTexts.done)),),
              const SizedBox(height: WNSizes.spaceBtwSections),

              SizedBox(
                width: double.infinity,
                child: TextButton(onPressed: () {}, child: const Text(WNTexts.resendEmail)),),

            ],
          ),

        ),
      )
    );
  }
}

