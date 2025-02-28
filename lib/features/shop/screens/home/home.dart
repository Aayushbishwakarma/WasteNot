import 'package:authentication/common/widgets/appbar/appbar.dart';
import 'package:authentication/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set the background color here
      backgroundColor: const Color(0xFFD9F9B8),

      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header --
            WNPrimaryHeaderContainer(
              child: Column(
                children: [
                  WNAppBar(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          WNTexts.homeAppbarTittle,
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 25,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          WNTexts.homeAppbarSubTittle,
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    action: [
                      Stack(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Iconsax.shopping_cart2,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
