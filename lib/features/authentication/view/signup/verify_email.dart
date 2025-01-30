import 'package:authentication/common/widgets/success_screen/success_screen.dart';
import 'package:authentication/features/authentication/view/login/login_view.dart';
import 'package:authentication/utils/constants/image_strings.dart';
import 'package:authentication/utils/constants/sizes.dart';
import 'package:authentication/utils/constants/text_strings.dart';
import 'package:authentication/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=> Get.offAll(()=> const LoginView()), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(WNSizes.defaultSpace),
          child: Column(
            children: [
              ///Image
              Image(image: const AssetImage(WNImages.verifyEmail), width: WNHelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: WNSizes.spaceBtwSections,),

              ///Title and Subtitile
              Text(WNTexts.verifyEmailTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: WNSizes.spaceBtwItems,),
              Text("test123@gmail.com", style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
              const SizedBox(height: WNSizes.spaceBtwItems,),
              Text(WNTexts.verifyEmailSubtitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: WNSizes.spaceBtwSections),

              ///Buttons
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(()=> SuccessScreen(
                image: WNImages.successEmail,
                title: WNTexts.createAccountTitle,
                subTitle: WNTexts.createAccountSubTitle,
                onPressed: ()=> Get.to(()=> const LoginView()),

              )), child: const Text("Verify")),),
              const SizedBox(height: WNSizes.spaceBtwItems,),
              SizedBox(width: double.infinity, child: TextButton(onPressed: (){}, child: const Text(WNTexts.resendEmail)),)

            ],
          ),
        ),
      ),
    );
  }
}

