import 'package:encode_decode/common/widgets/custom_text_button.dart';
import 'package:encode_decode/common/widgets/text_fields/text_field.dart';
import 'package:encode_decode/features/encryptor/logic/encryptor_cubit.dart';
import 'package:encode_decode/common/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DecodeSection extends StatelessWidget {
  const DecodeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EncryptorCubit, EncryptorState>(
      builder: (context, state) {
        return Column(
          children: [
            CTextField(
              controller:
                  BlocProvider.of<EncryptorCubit>(context).decodeTextController,
              label: "Enter text to decode",
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CTextField(
                controller: BlocProvider.of<EncryptorCubit>(context)
                    .decodeKeyTextController,
                label: "Enter decode key",
                keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            CustomButton(
              title: "Decrypt",
              backgroundColor: Colors.teal,
              onPressed: () {
                BlocProvider.of<EncryptorCubit>(context).decrypt();
              },
            ),
            const SizedBox(height: 20),
            if (state is DecryptSuccess)
              CustomTextButton(
                text: state.text,
                onPressed: () {
                  Clipboard.setData(
                    ClipboardData(text: state.text),
                  );
                },
              )
          ],
        );
      },
    );
  }
}
