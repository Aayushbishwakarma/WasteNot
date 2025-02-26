import 'package:authentication/features/shop/screens/ecommerce/ecommerce.dart';
import 'package:authentication/features/shop/screens/home/home.dart';
import 'package:authentication/features/shop/screens/profile/profile.dart';
import 'package:authentication/features/shop/screens/voucher/voucher.dart';
import 'package:authentication/utils/helpers/helper_functions.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = WNHelperFunctions.isDarkMode(context);
    final controller = Get.put(NavigationController());

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Container(

          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: FloatingActionButton(

            onPressed: () {},
            tooltip: 'Increment',
            elevation: 1.0,
            child: SvgPicture.asset(

              "assets/images/svgimages/qr.svg",
              colorFilter: ColorFilter.mode(
                dark ? Colors.white : Colors.black,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: dark ? Colors.black38 : Colors.white,
      bottomNavigationBar: Obx(
            () => CurvedNavigationBar(
          backgroundColor: Colors.grey.shade300,
          color: dark ? Colors.black38 : Colors.white60,
          height: 60,
          index: controller.selectedIndex.value,
          onTap: (index) => controller.selectedIndex.value = index,
          items: [
            SvgPicture.asset(
              "assets/images/svgimages/home.svg",
              colorFilter: ColorFilter.mode(
                dark ? Colors.white : Colors.black,
                BlendMode.srcIn,
              ),
            ),
            SvgPicture.asset(
              "assets/images/svgimages/voucher.svg",
              colorFilter: ColorFilter.mode(
                dark ? Colors.white : Colors.black,
                BlendMode.srcIn,
              ),
            ),
            SvgPicture.asset(
              "assets/images/svgimages/cart.svg",
              colorFilter: ColorFilter.mode(
                dark ? Colors.white : Colors.black,
                BlendMode.srcIn,
              ),
            ),
            SvgPicture.asset(
              "assets/images/svgimages/person.svg",
              colorFilter: ColorFilter.mode(
                dark ? Colors.white : Colors.black,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    VoucherScreen(),
    EcommerceScreen(),
  ];
}


