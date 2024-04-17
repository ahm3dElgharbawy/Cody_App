import 'package:encode_decode/features/base_converter/logic/cubit/base_converter_cubit.dart';
import 'package:encode_decode/features/base_converter/screens/converter/widgets/buttons_grid.dart';
import 'package:encode_decode/features/base_converter/screens/converter/widgets/text_field.dart';
import 'package:encode_decode/features/base_converter/screens/converter/widgets/text_fields_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseConverterScreen extends StatelessWidget {
  const BaseConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BaseConverterCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: OrientationBuilder(
            builder: (context, orientation) => Flex(
                direction: orientation == Orientation.landscape
                    ? Axis.horizontal
                    : Axis.vertical,
                children: const [
                  //? text fields
                  Expanded(
                    child: CTextFieldsForm()
                  ),
                  SizedBox(width: 50, height: 50),

                  //? grid or buttons
                  Expanded(
                    child: CButtonsGrid()
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
