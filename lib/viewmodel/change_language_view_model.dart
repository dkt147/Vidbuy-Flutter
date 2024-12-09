import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChangeViewModel with ChangeNotifier {
  Locale? _appLocale;
  Locale? get appLocale => _appLocale;

  void changeLanguage(Locale type) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _appLocale = type;
    if (type == Locale('en')) {
      print("english selected");
      await sp.setString('language_code', 'en');
    } else {
      print("portuguese selected");
      await sp.setString('language_code', 'pt');
    }
    notifyListeners();
  }
}

// class LanguageChangeViewModel with ChangeNotifier {
//   Locale _appLocale = Locale('en'); // Default to English
//   Locale get appLocale => _appLocale;

//   LanguageChangeViewModel() {
//     _loadSavedLanguage(); // Load saved language on initialization
//   }

//   void _loadSavedLanguage() async {
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     String? languageCode = sp.getString('language_code');
//     print("Loaded language code: $languageCode"); // Debugging
//     if (languageCode != null) {
//       _appLocale = Locale(languageCode);
//       notifyListeners();
//     }
//   }

//   void changeLanguage(Locale locale) async {
//     print("Changing language to: ${locale.languageCode}"); // Debugging
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     _appLocale = locale;
//     await sp.setString('language_code', locale.languageCode);
//     notifyListeners();
//   }
// }
