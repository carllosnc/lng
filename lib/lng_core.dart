import 'package:shared_preferences/shared_preferences.dart';
import './lng_notifier.dart';

class _LngCore {
  late final SharedPreferences prefs;

  init({
    required String defaultLang,
  }) async {
    prefs = await SharedPreferences.getInstance();

    final String? lang = prefs.getString('lang');
    lng.setLanguage(lang ?? defaultLang);
  }
}

final lngCore = _LngCore();
