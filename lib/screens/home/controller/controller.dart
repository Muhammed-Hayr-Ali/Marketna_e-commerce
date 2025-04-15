import 'package:application/utils/import.dart';

class HomeController extends GetxController {
  final supabase = Supabase.instance.client;

  RxBool isLoading = false.obs;
}
