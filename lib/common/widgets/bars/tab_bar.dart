import 'package:encode_decode/utils/constants/colors.dart';
import 'package:encode_decode/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CTabBar(
      {super.key, required this.tabsTitles, this.isScrollable = false});
  final bool isScrollable;
  final List<String> tabsTitles;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(.3)),
        ),
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: const EdgeInsets.all(0),
        labelColor: Theme.of(context).primaryColor,
        unselectedLabelColor:
            CHelperFunctions.isDark(context) ? CColors.white : CColors.black,
        isScrollable: isScrollable,
        indicator: UnderlineTabIndicator(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 3),
        ),
        tabs: tabsTitles.map((title) => Tab(text: title)).toList(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
