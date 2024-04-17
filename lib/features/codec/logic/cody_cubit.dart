import 'package:encode_decode/utils/helpers/codec_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'cody_state.dart';

class CodyCubit extends Cubit<CodyState> {
  CodyCubit() : super(CodyInitial());
  TextEditingController textController = TextEditingController();
  TextEditingController cipherController = TextEditingController();
  String method = "Asci";

  void getResult() {
    // text after encode
    if (method == "Asci") {
      cipherController.text =
          CCodecHelperFunctions.textToAsci(textController.text);
    } else if (method == "Binary") {
      cipherController.text =
          CCodecHelperFunctions.textToNumberSystem(textController.text, 2);
    }
  }

  void getSource() {
    // text before encode
    if (method == "Asci") {
      textController.text =
          CCodecHelperFunctions.asciToText(cipherController.text);
    }
    if (method == "Binary") {
      textController.text =
          CCodecHelperFunctions.numberSystemToText(cipherController.text, 2);
    }
  }

  @override
  Future<void> close() {
    textController.dispose();
    cipherController.dispose();
    return super.close();
  }
}
