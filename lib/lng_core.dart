import 'package:shared_preferences/shared_preferences.dart';
import './lng_notifier.dart';

class _LngCore {
  late final SharedPreferences prefs;

  init({
    required String defaultLang,
  }) async {
    prefs = await SharedPreferences.getInstance();

    /// get the current language from the shared preferences
    final String? lang = prefs.getString('lang');

    /// if the language is not set, set the default language
    lng.setLanguage(lang ?? defaultLang);
  }
}

final lngCore = _LngCore();
