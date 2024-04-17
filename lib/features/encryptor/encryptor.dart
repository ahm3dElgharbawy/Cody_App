import 'package:encode_decode/features/encryptor/screens/widgets/decode_section.dart';
import 'package:encode_decode/features/encryptor/screens/widgets/encode_section.dart';
import 'package:flutter/material.dart';

class EncryptorScreen extends StatelessWidget {
  const EncryptorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: const Column(children: [
            EncodeSection(),
            SizedBox(height: 20),
            DecodeSection()
          ]),
        ),
      ),
    );
  }


}
