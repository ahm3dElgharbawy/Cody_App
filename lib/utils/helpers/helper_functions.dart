import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class CHelperFunctions {
  //? add text to clipboard
  static void copyText(String text) async {
    await Clipboard.setData(
      ClipboardData(text: text),
    );
  }

  //? add text to clipboard
  static Future<String> pasteText() async {
    String text = await Clipboard.getData("text/plain").then((data) => data?.text ?? "");
    return text;
  }

  //? password generator
  static String generatePassword(int passLength) {
    String symbols =
        r"ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*_=+-/€.?<>)abcdefghijklmnopqrstuvwxyz0123456789";
    String password = "";
    Random random = Random();
    for (int i = 0; i < passLength; i++) {
      password += symbols[random.nextInt(symbols.length)];
    }
    return password;
  }

  //? check is dark theme or not
  static bool isDark(context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
