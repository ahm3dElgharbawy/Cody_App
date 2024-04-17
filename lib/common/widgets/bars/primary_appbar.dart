import 'package:encode_decode/common/widgets/bars/tab_bar.dart';
import 'package:encode_decode/utils/constants/colors.dart';
import 'package:encode_decode/utils/constants/texts.dart';
import 'package:encode_decode/utils/helpers/helper_functions.dart';
import 'package:encode_decode/utils/themes/theming_logic/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CPrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CPrimaryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDark(context);
    return AppBar(
      title: Text(
        CTexts.appMainTitle,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      actions: [
        BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
          return IconButton(
            onPressed: () {
              context.read<ThemeBloc>().add(ThemeChangedEvent());
            },
            splashRadius: 20,
            icon: dark
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.sunny, color: CColors.orange),
          );
        })
      ],
      bottom: const CTabBar(
        tabsTitles: ['Codec', 'Base Converter', 'Encryptor', 'Barcode'],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);
}
