
import 'package:application/constants/import.dart';

class LocalizationController {
  final GetStorage _storage = GetStorage();
  /// The key used to store the user's locale preference in the device's storage.


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
    _storage.write(StorageKeys.localeCode, localeCode);
  }

}
