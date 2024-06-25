import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _LngState extends ChangeNotifier {
  String currentLanguage = 'en';
  Map<String, Map<String, dynamic>> labels = {};
  Function(String)? onLangChange;
  late final SharedPreferences _prefs;

  /// [defaultLang] initial language
  init({
    required String defaultLang,
  }) async {
    _prefs = await SharedPreferences.getInstance();

    final String? lang = _prefs.getString('lang');
    lng.setLanguage(lang ?? defaultLang);
  }

  /// set the current language
  /// [language] is the language code
  void setLanguage(String language) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    currentLanguage = language.toString();
    prefs.setString('lang', language.toString());
    onLangChange?.call(language);

    notifyListeners();
  }

  /// add a new language
  /// [lngLabels] is a map with the language code as key and the labels as value
  void addLabels(Map<String, Map<String, dynamic>> lngLabels) {
    labels = lngLabels;

    notifyListeners();
  }

  /// get a label from the current language
  /// [key] is the key of the label
  dynamic get(String key) {
    if (labels[currentLanguage]![key] != null) {
      return labels[currentLanguage]![key];
    }
    return "[**LNG: INVALID KEY**]";
  }
}

final lng = _LngState();
