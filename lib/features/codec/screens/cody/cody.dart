import 'package:encode_decode/common/widgets/buttons/drop_down_button.dart';
import 'package:encode_decode/common/widgets/text_fields/text_field_with_icons.dart';
import 'package:encode_decode/features/codec/logic/cody_cubit.dart';
import 'package:encode_decode/utils/constants/sizes.dart';
import 'package:encode_decode/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CodyScreen extends StatelessWidget {
  const CodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(CSizes.defaultSpaces),
      child: Column(children: [
        Expanded(
          flex: 6,
          child: CTextFieldWithIcons(
            controller: context.read<CodyCubit>().textController,
            onChanged: (_) {
              context.read<CodyCubit>().getResult();
            },
            // onPaste: () async {
            //   controller.inputController.text +=
            //       await CHelperFunctions.pasteText();
            //   controller.getResult(); // show result in second text field
            // },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              const Text(CTexts.chooseMethod),
              const SizedBox(width: CSizes.spaceBtwSections),
              //? add drop down menu here
              Expanded(
                child: CDropDownButton(
                  onChanged: (value) {
                    context.read<CodyCubit>().method =
                        value!; // change codec method
                    context
                        .read<CodyCubit>()
                        .getResult(); // show result in second text field
                  },
                  value: context.read<CodyCubit>().method, // default selected value
                  items: const [
                    "Asci",
                    'Binary',
                    "Base64",
                    // "two",
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 6,
          child: CTextFieldWithIcons(
            controller: context.read<CodyCubit>().cipherController,
            onChanged: (_) {
              context.read<CodyCubit>().getSource();
            },
            // onPaste: () async {
            //   controller.outputController.text +=
            //       await CHelperFunctions.pasteText();
            //   controller.getSource();
            // },
          ),
        ),
      ]),
    );
  }
}
