import 'package:application/utils/import.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint('Initializing app...');
  /// Initialize GetStorage
  await GetStorage.init();
  /// Initialize Supabase
  await Supabase.initialize(
    url: Keys.URL,
    anonKey: Keys.ANON_KEY,
  );
  runApp(const MyApp());
}
