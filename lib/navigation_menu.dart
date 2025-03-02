import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Example screen imports; adjust paths to your project structure

import 'package:authentication/features/shop/screens/home/home.dart';
import 'package:authentication/features/shop/screens/voucher/voucher.dart';
import 'package:authentication/features/shop/screens/ecommerce/ecommerce.dart';
import 'package:authentication/utils/helpers/helper_functions.dart';

import 'features/authentication/qr_scanner/view/qr_scanner_view.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = WNHelperFunctions.isDarkMode(context);
    final controller = Get.put(NavigationController());

    return Scaffold(
      // 1. Allow body to extend behind the bottom bar if you want a seamless overlap
      extendBody: true,

      // 2. Position the FAB at the center docked location
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // 3. Remove extra bottom padding
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to your QR scanner screen
          Get.to(() => const QRScanner());
        },
        tooltip: 'Scan QR Code',
        elevation: 2.0,
        child: SvgPicture.asset(
          "assets/images/svgimages/qr.svg",
          colorFilter: ColorFilter.mode(
            dark ? Colors.white : Colors.black,
            BlendMode.srcIn,
          ),
        ),
      ),

      backgroundColor: dark ? Colors.black38 : Colors.white,

      // 4. CurvedNavigationBar configuration
      bottomNavigationBar: Obx(
            () => CurvedNavigationBar(
          // If you want the FAB to overlap, set the background to transparent
          backgroundColor: Colors.transparent,
          color: dark ? Colors.black38 : Colors.white60,
          height: 60,
          index: controller.selectedIndex.value,
          onTap: (index) => controller.selectedIndex.value = index,
          items: [
            SvgPicture.asset(
              "assets/images/svgimages/home.svg",
              colorFilter: _colorFilter(dark),
            ),
            SvgPicture.asset(
              "assets/images/svgimages/voucher.svg",
              colorFilter: _colorFilter(dark),
            ),
            SvgPicture.asset(
              "assets/images/svgimages/cart.svg",
              colorFilter: _colorFilter(dark),
            ),
            SvgPicture.asset(
              "assets/images/svgimages/person.svg",
              colorFilter: _colorFilter(dark),
            ),
          ],
        ),
      ),

      // 5. Show the screen corresponding to the current tab
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }

  ColorFilter _colorFilter(bool dark) {
    return ColorFilter.mode(
      dark ? Colors.white : Colors.black,
      BlendMode.srcIn,
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  // Update with your actual screens
  final screens = [
    HomeScreen(),
    VoucherScreen(),
    EcommerceScreen(),
  ];
}
