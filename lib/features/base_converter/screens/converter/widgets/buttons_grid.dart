import 'package:encode_decode/features/base_converter/logic/cubit/base_converter_cubit.dart';
import 'package:encode_decode/features/base_converter/screens/converter/widgets/icon_button_row.dart';
import 'package:encode_decode/features/base_converter/screens/converter/widgets/calc_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CButtonsGrid extends StatelessWidget {
  const CButtonsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //? actions section
        const CIconsButtonRow(),
        //? letters section
        Row(children: [
          ...List.generate(
            6,
            (index) => CGridButton(
              onPressed: () {
                context
                    .read<BaseConverterCubit>()
                    .write(String.fromCharCode(65 + index));
              },
              text: String.fromCharCode(65 + index),
              color: Colors.teal,
            ),
          )
        ]),
        //? numbers sections
        Row(children: [
          ...List.generate(
            5,
            (i) => CGridButton(
                text: "${5 + i}",
                onPressed: () {
                  context.read<BaseConverterCubit>().write("${5 + i}");
                }),
          ),
        ]),
        Row(children: [
          ...List.generate(
            5,
            (i) => CGridButton(
                text: "$i",
                onPressed: () {
                  context.read<BaseConverterCubit>().write("$i");
                }),
          ),
        ]),
      ],
    );
  }
}
