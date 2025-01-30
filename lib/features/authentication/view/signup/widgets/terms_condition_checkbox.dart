import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class WNTermsAndConditioncheckbox extends StatelessWidget {
  const WNTermsAndConditioncheckbox({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = WNHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox( width: 24, height: 24,child: Checkbox(value: true, onChanged: (value){})),
        const SizedBox(width: WNSizes.spaceBtwInputFields,),
        Text.rich(
          TextSpan(
              children:[
                TextSpan(text:WNTexts.iAgreeTo,style: Theme.of(context).textTheme.bodySmall),
                TextSpan(text: WNTexts.privacyPolicy,style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? WNColors.textWhite : WNColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? WNColors.textWhite : WNColors.primary,
                )),
                TextSpan(
                    text: WNTexts.and,style: Theme.of(context).textTheme.bodySmall
                ),
                TextSpan(text: WNTexts.termsofuse,style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? WNColors.textWhite : WNColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? WNColors.textWhite : WNColors.primary
                ),),
              ]),
        ),
      ],
    );
  }
}
