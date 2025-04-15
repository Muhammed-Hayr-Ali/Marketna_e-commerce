import 'package:application/utils/import.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint('Initializing app...');
  /// Initialize GetStorage
  await GetStorage.init();
  /// Initialize Supabase
  await Supabase.initialize(
    url: AppConstants.url,
    anonKey: AppConstants.anonKey,
  );
  runApp(const MyApp());
}
