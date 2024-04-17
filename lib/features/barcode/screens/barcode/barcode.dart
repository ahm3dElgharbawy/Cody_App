import 'package:encode_decode/common/widgets/buttons/button_with_leading.dart';
import 'package:encode_decode/common/widgets/text_fields/text_field_with_icons.dart';
import 'package:encode_decode/features/barcode/logic/barcode_cubit.dart';
import 'package:encode_decode/features/barcode/screens/barcode/widgets/pick_button.dart';
import 'package:encode_decode/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class BarCodeScreen extends StatelessWidget {
  const BarCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(CSizes.defaultSpaces),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Encode",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              CTextFieldWithIcons(
                controller: context.read<BarcodeCubit>().textController,
              ),
              const SizedBox(height: CSizes.spaceBtwItems / 2),
              Row(
                children: [
                  const SizedBox(
                    width: 48,
                  ),
                  Expanded(
                    child: CButtonWithLeading(
                      onTap: () {
                        context.read<BarcodeCubit>().createBarcode(context);
                      },
                      icon: Icons.check,
                      title: "Create barcode",
                    ),
                  ),
                ],
              ),
              const Divider(),
              const Text(
                "Decode",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              Row(
                children: [
                  Expanded(
                    child: CPickButton(
                        icon: Icons.camera_alt,
                        title: "Camera",
                        onTap: () {
                          context
                              .read<BarcodeCubit>()
                              .imageToCode(context, ImageSource.camera);
                        }),
                  ),
                  const SizedBox(width: CSizes.spaceBtwItems),
                  Expanded(
                    child: CPickButton(
                      icon: Icons.image,
                      title: "From Gallery",
                      onTap: () {
                        context
                            .read<BarcodeCubit>()
                            .imageToCode(context, ImageSource.gallery);
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
