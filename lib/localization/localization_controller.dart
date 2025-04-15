import 'package:application/utils/import.dart';

class LocalizationController {
  final GetStorage _storage = GetStorage();

  // الحصول على اللغة بناءً على الإعدادات أو اللغة الافتراضية للجهاز
  Locale? get language {
    final loc = _getLocale();
    return loc != 'auto' ? Locale(loc) : Locale(Get.deviceLocale!.languageCode);
  }

  // قراءة اللغة من التخزين، الافتراضية هي 'auto'
  String _getLocale() {
    return _storage.read('locale') ?? 'auto';
  }

  // يمكنك إضافة وظيفة لتحديث اللغة في التخزين
  void updateLocale(String newLocale) {
    _storage.write('locale', newLocale);
  }
}
