import 'package:application/utils/import.dart';

class SettingsController extends GetxController {
  final _storage = GetStorage();
  final _main = SettingsMainController();
  Future<void> updateLanguage() async {
    final locale = _storage.read(STORAGE_KEYS.LOCALE);
    final result = await _main.openLanguage(locale);
    if (result != null) Get.updateLocale(Locale(result));
    _storage.write(STORAGE_KEYS.LOCALE, result);
  }
}
