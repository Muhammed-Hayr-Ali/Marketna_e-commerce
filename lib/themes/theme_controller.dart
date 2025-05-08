import 'package:application/constants/import.dart';

class ThemeController {
  final GetStorage _storage = GetStorage();

  // الحصول على وضع السمة بناءً على الإعدادات المخزنة
  ThemeMode get theme {
    String theme = _getTheme();
    return _mapThemeMode(theme);
  }

  // قراءة السمة من التخزين، الافتراضية هي 'auto'
  String _getTheme() {
    return _storage.read('theme') ?? 'light';
  }

  // تحويل قيمة السمة إلى وضع السمة المناسب
  ThemeMode _mapThemeMode(String theme) {
    switch (theme) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'auto':
      default:
        return ThemeMode.system;
    }
  }

  // يمكنك إضافة دالة لتحديث السمة في التخزين
  void updateTheme(String newTheme) {
    _storage.write('theme', newTheme);
  }
}
