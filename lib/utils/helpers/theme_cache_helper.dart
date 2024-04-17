import 'package:shared_preferences/shared_preferences.dart';

class ThemeCacheHelper {
  static void cacheTheme({required bool isDark}) async { // 0 for dark
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("isDark", isDark);
  }

  static Future<bool> isCachedThemeDark() async { // 1 for light
    final sharedPreferences = await SharedPreferences.getInstance();
    bool? isDark = sharedPreferences.getBool("isDark");
    return isDark ?? false;
  }
}
