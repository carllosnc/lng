import 'package:flutter_test/flutter_test.dart';
import 'package:lng/lng.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group("lng", () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    test("Check lng.init", () {
      lng.init(defaultLang: 'en');
      expect(lng.currentLanguage, 'en');
    });

    test("Check lng.addLabels", () {
      lng.addLabels({
        'en': {
          'es': 'Spanish',
          'en': 'English',
          'text': 'Hello World',
        },
        'es': {
          'es': 'Español',
          'en': 'Inglés',
          'text': 'Hola Mundo',
        },
      });

      expect(lng.get('es'), 'Spanish');
      expect(lng.get('en'), 'English');
      expect(lng.get('text'), 'Hello World');
    });

    test("Check lng.setLanguage", () {
      lng.setLanguage('es');
      lng.onLangChange = (String language) {
        expect(language, 'es');

        expect(lng.get('es'), 'Español');
        expect(lng.get('en'), 'Inglés');
        expect(lng.get('text'), 'Hola Mundo');
      };
    });
  });
}
