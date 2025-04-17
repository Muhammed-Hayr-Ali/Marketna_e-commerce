import 'package:application/utils/import.dart';

class ManageAddressesController extends GetxController {
  final _supabase = Supabase.instance.client;
  bool isLoading = true;
  List<Address> addresses = [];

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
          .eq(AppConstants.CUSTOMER_ID, customerId);

      // Check if the response is empty
      if (response.isEmpty) return;

      // Update the addresses list with the fetched data
      addresses = List<Address>.from(
        response.map((address) => Address.fromJson(address)),
      );
    } catch (error) {
      // Handle errors and show error notification
      CustomNotification.showSnackbar(message: AppConstants.DATA_LOADING_ERROR);
      debugPrint(error.toString());
    } finally {
      // Set loading state to false
      isLoading = false;
        update();
  }
  }
}
