import 'dart:developer';

import 'package:flutter/material.dart';
import 'app.dart';
import 'package:lng/lng.dart';
import './labels.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  lngCore.init(defaultLang: 'en');
  lng.addLabels(labels);
  lng.onLangChange = (String language) {
    log('Language changed to $language');
  };

  runApp(const App());
}
