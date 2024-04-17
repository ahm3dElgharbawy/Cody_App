import 'package:encode_decode/common/widgets/custom_text_button.dart';
import 'package:encode_decode/common/widgets/buttons/custom_button.dart';
import 'package:encode_decode/common/widgets/text_fields/text_field.dart';
import 'package:encode_decode/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordGeneratorScreen extends StatefulWidget {
  const PasswordGeneratorScreen({super.key});

  @override
  State<PasswordGeneratorScreen> createState() => _PasswordGeneratorScreenState();
}

class _PasswordGeneratorScreenState extends State<PasswordGeneratorScreen> {
  String password = "";
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Password Generator"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          CTextField(
            controller: controller,
            label: "password length",
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          CustomButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                try {
                  password =
                      CHelperFunctions.generatePassword(int.parse(controller.text));
                } catch (e) {
                  password = "not valid input";
                }
                setState(() {});
              }
            },
            title: "Generate",
            backgroundColor: Colors.blue,
          ),
          const SizedBox(height: 20),
          if (password != "")
            CustomTextButton(
              text: password,
              onPressed: () {
                Clipboard.setData(
                  ClipboardData(text: password),
                );
              },
            )
        ]),
      ),
    );
  }
}
