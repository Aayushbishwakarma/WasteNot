/*
import 'package:authentication/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';



class UserProfileViews extends StatelessWidget {
  const UserProfileViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WNAppBar(showBackArrow: true, tittle: Text('Profile')),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(WNSizes.defaultSpace),
          child: Column(
            children: [

              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const WNCircularImage(
                        image: WNImages.user, width: 80, height: 80),
                    TextButton(onPressed: () {},
                        child: const Text('Change Profile Picture'))
                  ],
                ),
              ),

              ///Details

              const SizedBox(height: WNSize.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: WNSizes.spaceBtwItems),
              const WNSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: WNSizes.spaceBtwItems),

              profile_menu(title: 'Name', value: 'Waste Not', onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}

class profile_menu extends StatelessWidget {
  const profile_menu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3, child: Text('Name', style: Theme
            .of(context)
            .textTheme
            .bodySmall, overflow: TextOverflow.ellipsis)),
        Expanded(flex: 5, child: Text('Waste Not', style: Theme
            .of(context)
            .textTheme
            .bodyMedium, overflow: textOverflow.ellipsis)),
        Expanded(child: const Icon(Iconsax.arrow_right_34, size: 18)),
      ],
    );
  }
}
 */



