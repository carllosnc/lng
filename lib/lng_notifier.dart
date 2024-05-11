import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _LngNotifier extends ChangeNotifier {
  String currentLanguage = 'en';
  Map<String, Map<String, dynamic>> labels = {};

  /// set the current language
  /// [language] is the language code
  void setLanguage(String language) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    currentLanguage = language.toString();

    /// set the current language to the shared preferences
    prefs.setString('lang', language.toString());

    /// notify the listeners
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
    return labels[currentLanguage]![key];
  }
}

final lng = _LngNotifier();

mixin LngMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    lng.addListener(action);
  }

  @override
  void dispose() {
    super.dispose();
    lng.removeListener(action);
  }

  action() {
    setState(() {});
  }
}
