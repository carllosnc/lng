import 'package:flutter/material.dart';
import 'app.dart';
import 'package:lng/lng.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  lngCore.init(defaultLang: 'en');
  lng.addLabels({
    'en': {
      'pt': 'Portuguese',
      'en': 'English',
      'es': 'Spanish',
      'fr': 'French',
      'hello': 'Hello',
      'world': 'World',
      'app_title': 'Manual language switcher',
      'color': Colors.red.shade100,
    },
    'es': {
      'pt': 'Portugués',
      'en': 'Inglés',
      'es': 'Español',
      'fr': 'Francés',
      'hello': 'Hola',
      'world': 'Mundo',
      'app_title': 'Cambiar de idioma manualmente',
      'color': Colors.blue.shade100,
    },
    'fr': {
      'pt': 'Portugais',
      'en': 'Anglais',
      'es': 'Espagnol',
      'fr': 'Français',
      'hello': 'Bonjour',
      'world': 'Monde',
      'app_title': 'Basculer de langue manuellement',
      'color': Colors.green.shade100,
    },
    'pt': {
      'pt': 'Português',
      'en': 'Inglês',
      'es': 'Espanhol',
      'fr': 'Francês',
      'hello': 'Olá',
      'world': 'Mundo',
      'app_title': 'Mudar de idioma manualmente',
      'color': Colors.yellow.shade100,
    }
  });

  runApp(const App());
}
