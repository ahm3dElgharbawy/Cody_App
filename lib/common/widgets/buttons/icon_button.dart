import 'package:encode_decode/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CIconButton extends StatelessWidget {
  const CIconButton({
    super.key,
    required this.icon,
    this.iconSize = CSizes.sm,
    required this.onTap,
  });
  final IconData icon;
  final double iconSize;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(iconSize),
          child: Icon(
            icon,
            size: CSizes.lg,
          ),
        ),
      ),
    );
  }
}
