import 'package:encode_decode/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CDropDownButton extends StatelessWidget {
  const CDropDownButton({super.key, required this.items, required this.onChanged, required this.value});
  final List<String> items;
  final Function(String?) onChanged;
  final String value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DropdownButtonFormField(
        onChanged: onChanged,
        iconSize: 0,
        value: value,
        style: Theme.of(context).textTheme.labelLarge,
        borderRadius: BorderRadius.circular(CSizes.inputRadius),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: CSizes.md),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
        ),
        
        items: items.map(
          (item) => DropdownMenuItem(
            value: item,
            child: Text(item),
          ),
        ).toList()
      ),
    );
  }
}
