import 'package:authentication/utils/constants/colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.green,
        items: [
        SvgPicture.asset("assets/images/svgimages/home.svg"),
        SvgPicture.asset("assets/images/svgimages/voucher.svg"),
        SvgPicture.asset("assets/images/svgimages/qr.svg"),
        SvgPicture.asset("assets/images/svgimages/person.svg"),
        ],
      ),
    );
  }
}

