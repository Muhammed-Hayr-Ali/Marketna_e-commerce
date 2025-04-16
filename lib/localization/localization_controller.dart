import 'package:application/utils/import.dart';

class LocalizationController {
  final GetStorage _storage = GetStorage();
  /// The key used to store the user's locale preference in the device's storage.
  static const String _localeKey = 'locale';


  Locale? get language {
    final loc = _getLocale();
    return loc != 'auto' ? Locale(loc) : Locale(Get.deviceLocale!.languageCode);
  }

  String _getLocale() => _storage.read<String>('locale') ?? 'auto';


  /// Updates the user's locale preference.
  ///
  /// [locale] is the two-letter [ISO 639-1] language code for the locale.
  /// For example, 'en' or 'ar'.
  void updateLocale(String localeCode) {
    _storage.write(_localeKey, localeCode);
  }

}
