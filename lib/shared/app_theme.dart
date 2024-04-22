import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

ThemeData lightMode = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    textTheme: GoogleFonts.comfortaaTextTheme(),
    primaryColor: AppColors.primaryColor,
    colorScheme: const ColorScheme.light(
      background: AppColors.scafoldColor,
      primary: AppColors.textColor,
    ));

ThemeData darkMode = ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    textTheme: GoogleFonts.comfortaaTextTheme(),
    primaryColor: AppColors.primaryColor,
    colorScheme: const ColorScheme.dark(
        background: Colors.black, primary: AppColors.scafoldColor));

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }

  void loadThemeFromLocalStorage(bool isDarkMode) {
    themeData = isDarkMode ? darkMode : lightMode;
  }
}
