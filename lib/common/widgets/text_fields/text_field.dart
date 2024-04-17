import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  const CTextField({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.none,
    this.onTap,
  });
  final String label;
  final TextEditingController controller;
  final VoidCallback? onTap;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType, //hiding the keyboard
      controller: controller,
      onTap: onTap,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(30)),
        floatingLabelStyle: TextStyle(color: Theme.of(context).primaryColor),
        contentPadding: const EdgeInsets.symmetric(horizontal: 25),
        label: Text(label),
      ),
    );
  }
}
