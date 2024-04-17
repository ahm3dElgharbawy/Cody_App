import 'package:encode_decode/utils/constants/colors.dart';
import 'package:encode_decode/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

abstract class CTextFieldTheme {
  static InputDecorationTheme lightTextFieldDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: CColors.darkGrey,
    suffixIconColor: CColors.darkGrey,
    contentPadding: const EdgeInsets.symmetric(vertical: 15),
    labelStyle: const TextStyle().copyWith(fontSize: CSizes.fontSizeSm, color: CColors.black),
    hintStyle: const TextStyle().copyWith(fontSize: CSizes.fontSizeSm, color: CColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: CColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CSizes.inputRadius),
      borderSide: const BorderSide(width: 1, color: CColors.grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(CSizes.inputRadius),
      borderSide: const BorderSide(width: 1, color: CColors.grey),
    ),
    focusedBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CSizes.inputRadius),
      borderSide: const BorderSide(width: 1, color: CColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CSizes.inputRadius),
      borderSide: const BorderSide(width: 1, color: CColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CSizes.inputRadius),
      borderSide: const BorderSide(width: 2, color: CColors.warning),
    ),
  );

  static InputDecorationTheme darkTextFieldDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: CColors.darkGrey,
    suffixIconColor: CColors.darkGrey,
    contentPadding: const EdgeInsets.symmetric(vertical: 15),
    labelStyle: const TextStyle().copyWith(fontSize: CSizes.fontSizeSm, color: CColors.white),
    hintStyle: const TextStyle().copyWith(fontSize: CSizes.fontSizeSm, color: CColors.white),
    floatingLabelStyle: const TextStyle().copyWith(color: CColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CSizes.inputRadius),
      borderSide: const BorderSide(width: 1, color: CColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CSizes.inputRadius),
      borderSide: const BorderSide(width: 1, color: CColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CSizes.inputRadius),
      borderSide: const BorderSide(width: 1, color: CColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CSizes.inputRadius),
      borderSide: const BorderSide(width: 1, color: CColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CSizes.inputRadius),
      borderSide: const BorderSide(width: 2, color: CColors.warning),
    ),
  );
}
