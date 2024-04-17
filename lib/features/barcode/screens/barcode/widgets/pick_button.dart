import 'package:encode_decode/utils/constants/sizes.dart';
import 'package:encode_decode/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CPickButton extends StatelessWidget {
  const CPickButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDark(context);
    return SizedBox(
      height: 200,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.grey.withOpacity(.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50,
                color: dark ? Colors.white : Colors.grey[700],
              ),
              const SizedBox(height: CSizes.xs),
              Text(
                title,
                style: TextStyle(
                  color: dark ? Colors.white : Colors.grey[700],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
