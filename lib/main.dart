import 'package:application/myapp.dart';
import 'package:application/constants/import.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize GetStorage
  await GetStorage.init();

  /// Initialize Supabase
  await Supabase.initialize(url: AppKeys.url, anonKey: AppKeys.anonKey);
  runApp(const MyApp());
}
