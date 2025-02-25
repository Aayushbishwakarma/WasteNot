import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';


class WNCircularContainer extends StatelessWidget {
  const WNCircularContainer({
    super.key,
    this.child,
    this.width= 400,
    this.backgroundColor = WNColors.textWhite,
    this.height= 400,
    this.padding= 0,
    this.radius=400,

  });

  final double? width;
  final double? height;
  final double  radius;
  final double  padding;
  final Widget? child;
  final Color backgroundColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding:const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(400),
        color: WNColors.textWhite.withOpacity(0.3),
      ),
      child: child,
    );
  }
}
