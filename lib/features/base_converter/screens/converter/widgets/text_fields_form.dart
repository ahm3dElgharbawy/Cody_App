import 'package:encode_decode/common/widgets/text_fields/text_field.dart';
import 'package:encode_decode/features/base_converter/logic/cubit/base_converter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CTextFieldsForm extends StatelessWidget {
  const CTextFieldsForm({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> labels = [
      "Decimal (0 - 9)",
      "Binary (0 - 1)",
      "Oct (0 - 8)",
      "Hex (0 - 9A - F)"
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          ...List.generate(
            4,
            (index) => Column(
              children: [
                CTextField(
                  label: labels.elementAt(index),
                  controller:
                      context.read<BaseConverterCubit>().textControllers[index],
                  onTap: () {
                    context
                        .read<BaseConverterCubit>()
                        .changeActiveController(index);
                  },
                ),
                const SizedBox(height: 15),
              ],
            ),
          )
        ],
      ),
    );
  }
}
