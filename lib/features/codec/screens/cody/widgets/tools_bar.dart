import 'package:flutter/material.dart';

class ToolsBar extends StatelessWidget {
  const ToolsBar({super.key, required this.actions});
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: actions,
      ),
    );
  }
}
