import 'package:flutter/material.dart';
import 'app.dart';
import 'package:lng/lng.dart';
import './labels.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  lngCore.init(defaultLang: 'en');
  lng.addLabels(labels);

  runApp(const App());
}
