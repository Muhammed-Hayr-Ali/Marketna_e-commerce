import 'package:application/utils/import.dart';

class ManageAddressesController extends GetxController {
  final _supabase = Supabase.instance.client;
  RxBool isLoading = true.obs;
  var addresses = <Address>[].obs;

  @override
  void onInit() {
    loadAddresses();
    super.onInit();
  }

  /// Loads the addresses for the current user.
  ///
  /// This function fetches the list of addresses associated with the current user
  /// from the database and updates the [addresses] observable list.
  Future<void> loadAddresses() async {
    // Get the current user ID
    final customerId = _supabase.auth.currentUser!.id;

    try {
      // Query the database for addresses linked to the current user
      final response = await _supabase
          .from(KEYS.ADDRESSES_TABLE)
          .select()
          .eq('customer_id', customerId);

      // Update the addresses list with the fetched data
      addresses.assignAll(response.map((e) => Address.fromJson(e)));
    } finally {
      // Set loading state to false
      isLoading.value = false;
    }
  }
}
