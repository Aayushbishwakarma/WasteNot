/*
import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

class WNProfileMenu extends StatelessWidget {
  const WNProfileMenu({
    super.key,
    required this.onPressed,
    required this.tittle,
    required this.value,
    this.icon =Iconsax.arrow_right_34,
  });

final IconData icon;
final VoidCallback onPressed;
final String tittle, value;


@override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap: onPressed,
    child: Padding(
        padding: const EdgeInsets.symmetric(vertical: WNSizes.spaceBtwItems / 1.5),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(tittle,style: Theme.of(context).textTheme.bodySmall,overflow: TextOverflow.ellipsis)),
          Expanded(flex: 5, child: Text(value,style: Theme.of(context).textTheme.bodyMedium,overflow: textOverflow.ellipsis)),
          Expanded(child: const Icon(Iconsax.arrow_right_34, size: 18)),
        ],
      ),
    ),
  );
}
}

 */
