abstract class CCodecHelperFunctions {
  //? Asci
  static String textToAsci(String text) {
    return text.codeUnits.join(" ");
  }

  static String asciToText(String asciText) {
    return asciText.split(" ").map((value) {
      try {
        var result = int.tryParse(value);
        return result == null ? value : String.fromCharCode(result);
      } catch (e) {
        return value;
      }
    }).join();
  }

  //? Binary
  static String textToNumberSystem(String text, int base) {
    return text.codeUnits
        .map((value) => value.toRadixString(base).padLeft(8, "0"))
        .join(" ");
  }

  static String numberSystemToText(String numbers, int base) {
    return numbers.split(" ").map((value) {
      try {
        var result = int.tryParse(value, radix: base);
        return result == null ? value : String.fromCharCode(result);
      } catch (e) {
        return value;
      }
    }).join();
  }
}
