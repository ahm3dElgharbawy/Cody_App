import 'package:encode_decode/features/base_converter/logic/cubit/base_converter_cubit.dart';
import 'package:encode_decode/features/base_converter/screens/converter/widgets/calc_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CIconsButtonRow extends StatelessWidget {
  const CIconsButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CGridButton(
            icon: Icons.share,
            onPressed: () {
              context.read<BaseConverterCubit>().action(ButtonActions.share);
            },
            color: Colors.blueAccent),
        CGridButton(
            icon: Icons.copy,
            onPressed: () {
              context.read<BaseConverterCubit>().action(ButtonActions.copy);
            },
            color: Colors.blueAccent),
        CGridButton(
          icon: Icons.paste,
          onPressed: () {
            context.read<BaseConverterCubit>().action(ButtonActions.paste);
          },
          color: Colors.blueAccent,
        ),
        CGridButton(
          icon: Icons.backspace_outlined,
          onPressed: () {
            context.read<BaseConverterCubit>().action(ButtonActions.backSpace);
          },
          color: Colors.blueAccent,
        ),
        CGridButton(
          icon: Icons.clear,
          onPressed: () {
            context.read<BaseConverterCubit>().action(ButtonActions.clear);
          },
          color: const Color(0xFFEF6E6E),
        ),
      ],
    );
  }
}
