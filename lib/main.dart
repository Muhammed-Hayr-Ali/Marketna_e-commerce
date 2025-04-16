import 'package:application/utils/import.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint('Initializing app...');
  /// Initialize GetStorage
  /// TEXT
  await GetStorage.init();
  /// Initialize Supabase
  await Supabase.initialize(
    url: KEYS.URL,
    anonKey: KEYS.ANON_KEY,
    debug: true,
  );
  runApp(const MyApp());
}
