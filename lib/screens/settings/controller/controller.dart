import 'package:application/utils/import.dart';

class SettingsController extends GetxController {
  final _storage = GetStorage();
  final _main = SettingsMainController();
  Future<void> updateLanguage() async {
    final String? savedLocale = _storage.read<String>(StorageKey.locale);
    debugPrint('Saved locale: $savedLocale');
    final String? selectedLocale = await _main.openLanguage(savedLocale);
    if (selectedLocale == 'auto') {
      Get.updateLocale(Locale(Get.deviceLocale!.languageCode));
    } else if (selectedLocale != null) {
      Get.updateLocale(Locale(selectedLocale));
    }
    if (selectedLocale == null) return;
    await _storage.write(StorageKey.locale, selectedLocale);
  }
}
