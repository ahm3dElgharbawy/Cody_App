import 'package:encode_decode/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CButtonWithLeading extends StatelessWidget {
  const CButtonWithLeading({super.key,required this.onTap,required this.title,this.backgroundColor = Colors.teal, required this.icon, this.width, this.height});
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Color backgroundColor;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: Colors.white,
            shape: const StadiumBorder()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 16,
            ),
            const SizedBox(width: CSizes.spaceBtwItems),
            Text(title),
          ],
        ),
      ),
    );
  }
}
