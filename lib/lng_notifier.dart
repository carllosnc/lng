import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _LngNotifier extends ChangeNotifier {
  String currentLanguage = 'en';
  Map<String, Map<String, dynamic>> labels = {};

  void setLanguage(String language) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    currentLanguage = language.toString();

    prefs.setString('lang', language.toString());

    notifyListeners();
  }

  void addLabels(Map<String, Map<String, dynamic>> lngLabels) {
    labels = lngLabels;
    notifyListeners();
  }

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
