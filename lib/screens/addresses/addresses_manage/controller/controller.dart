import 'package:application/utils/import.dart';

class ManageAddressesController extends GetxController {
  final _supabase = Supabase.instance.client;
  RxBool isLoading = true.obs;
  var addresses = <AddressModel>[].obs;

  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  Future<void> initialize() async {
    try {
      final customerId = _supabase.auth.currentUser!.id;
      final response = await _supabase
          .from(KEYS.addressesTable)
          .select()
          .eq('customer_id', customerId);
      addresses.value = response.map((e) => AddressModel.fromJson(e)).toList();
    } catch (error) {
      debugPrint(error.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
