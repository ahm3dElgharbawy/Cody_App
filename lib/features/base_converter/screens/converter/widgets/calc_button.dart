import 'package:flutter/material.dart';

class CGridButton extends StatelessWidget {
  const CGridButton({super.key,this.text, required this.onPressed, this.color = Colors.blueGrey, this.icon,});
  final String? text;
  final VoidCallback onPressed;
  final IconData? icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(backgroundColor: color,padding: EdgeInsets.zero),
          child: icon == null? Text(text ?? "") : Icon(icon,size: 20,),
        ),
      ),
    );
  }
}
