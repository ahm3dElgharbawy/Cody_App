import 'package:encode_decode/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:share_plus/share_plus.dart';

part 'base_converter_state.dart';

class BaseConverterCubit extends Cubit<BaseConverterState> {
  BaseConverterCubit() : super(BaseConverterInitial());
  List<TextEditingController> textControllers = List.generate(4, (index) => TextEditingController());
  TextEditingController? activeController;
  int? activeIndex;
  // on tap text field
  void changeActiveController(int index) {
    activeController = textControllers[index];
    activeIndex = index;
  }

  write(String char) {
    if(activeController != null){
      // Remove unwanted digits from text field
      activeController!.text += char;
      if(activeIndex != 3){
        activeController!.text = activeController!.text.replaceAll(RegExp(activeIndex == 0 ? r"[^0-9]" : (activeIndex == 1) ? r"[^0-1]": r"[^0-7]" ), "");
      }
      if(activeController!.text.isNotEmpty) convert();
    }
  }


  action(ButtonActions action) async { // on tap icons button
    if (action == ButtonActions.clear) {
      for (var element in textControllers) {
        element.clear();
      }
    } else if (action == ButtonActions.backSpace &&
        activeController != null &&
        activeController!.text.isNotEmpty) {
      final text = activeController!.text;
      activeController!.text = text.replaceAll(
          RegExp(r".$"), ""); // remove last character from string
    } else if (action == ButtonActions.paste && activeController != null) {
      activeController!.text = await CHelperFunctions.pasteText();

    } else if (action == ButtonActions.copy &&
        activeController != null &&
        activeController!.text.isNotEmpty) {
      CHelperFunctions.copyText(activeController!.text);
    } else if (action == ButtonActions.share && activeController != null) {
      await Share.share(activeController!.text);
    }
  }

  convert() {
    if (activeIndex == 0) {
      // Decimal
      BigInt decimalNumber = BigInt.parse(activeController!.text);
      textControllers[1].text = decimalNumber.toRadixString(2); // binary
      textControllers[2].text = decimalNumber.toRadixString(8); // octal
      textControllers[3].text = decimalNumber.toRadixString(16).toUpperCase(); // hexadecimal
    } else if (activeIndex == 1) {
      // Binary
      BigInt decimalNumber = BigInt.parse(activeController!.text, radix: 2);
      textControllers[0].text = decimalNumber.toString(); // decimal
      textControllers[2].text = decimalNumber.toRadixString(8); // octal
      textControllers[3].text = decimalNumber.toRadixString(16).toUpperCase(); // hexadecimal
    } else if (activeIndex == 2) {
      // Oct
      BigInt decimalNumber = BigInt.parse(activeController!.text, radix: 8);
      textControllers[0].text = decimalNumber.toString(); // decimal
      textControllers[1].text = decimalNumber.toRadixString(2); // binary
      textControllers[3].text = decimalNumber.toRadixString(16).toUpperCase(); // hexadecimal
    } else {
      // Hex
      BigInt decimalNumber = BigInt.parse(activeController!.text, radix: 16);
      textControllers[0].text = decimalNumber.toString(); // decimal
      textControllers[1].text = decimalNumber.toRadixString(2); // binary
      textControllers[2].text = decimalNumber.toRadixString(8); // octal
    }
  }

  @override
  Future<void> close() {
    for (var controller in textControllers) {
      controller.dispose();
    }
    return super.close();
  }
}

enum ButtonActions { clear, backSpace, paste, copy, share }
