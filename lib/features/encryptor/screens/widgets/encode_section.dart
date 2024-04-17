import 'package:encode_decode/common/widgets/custom_text_button.dart';
import 'package:encode_decode/common/widgets/text_fields/text_field.dart';
import 'package:encode_decode/features/encryptor/logic/encryptor_cubit.dart';
import 'package:encode_decode/common/widgets/buttons/custom_button.dart';
import 'package:encode_decode/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EncodeSection extends StatelessWidget {
  const EncodeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EncryptorCubit, EncryptorState>(
      builder: (context, state) {
        return Column(
          children: [
            CTextField(
              controller:
                  BlocProvider.of<EncryptorCubit>(context).encodeTextController,
              label: "Enter any Text",
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CTextField(
              controller: BlocProvider.of<EncryptorCubit>(context)
                  .encodeKeyTextController,
              label: "Enter encode key",
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            CustomButton(
              title: "Encrypt",
              backgroundColor: Colors.red,
              onPressed: () {
                BlocProvider.of<EncryptorCubit>(context).encrypt();
              },
            ),
            const SizedBox(height: 20),
            if (state is EncryptSuccess)
              CustomTextButton(
                text: state.text,
                onPressed: () {
                  CHelperFunctions.copyText(state.text);
                },
              )
          ],
        );
      },
    );
  }
}
