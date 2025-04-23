import 'package:application/utils/import.dart';

class ManageAddressesController extends GetxController {
  final _supabase = Supabase.instance.client;
  final _main = ManageAddressesMainController();
  String? userId;
  bool isLoading = true;
  List<Address> addresses = [];

  @override
  void onInit() {
    debugPrint('Initializing ManageAddressesController...');
    // Initialize the customerId with the current user's ID
    userId = _supabase.auth.currentUser!.id;
    // Load addresses when the controller is initialized
    loadAddresses();
    super.onInit();
  }

  /// Loads the addresses for the current user.
  ///
  /// This function fetches the list of addresses associated with the current user
  /// from the database and updates the [addresses] observable list.
  Future<void> loadAddresses() async {
    debugPrint('Loading addresses...');

    if (userId == null) {
      debugPrint('user ID is null. Cannot load addresses.');
      return;
    }

    try {
      // Query the database for addresses linked to the current user
      final response = await _supabase
          .from(KEYS.ADDRESSES_TABLE)
          .select()
          .eq(KEYS.USER_ID, userId!);

      // Check if the response is empty
      if (response.isEmpty) {
        debugPrint('No addresses found for the user.');
        return;
      }

      // Update the addresses list with the fetched data
      addresses = List<Address>.from(
        response.map((address) => Address.fromJson(address)),
      );
      // Update the state to notify listeners
    } catch (error) {
      // Handle errors and show error notification
      //  CustomNotification.showSnackbar(message: AppConstants.DATA_LOADING_ERROR);
      debugPrint(error.toString());
    } finally {
      // Set loading state to false
      isLoading = false;
      update();
    }
  }

  /// Deletes an address from the database based on the provided [addressId].
  ///
  /// This function attempts to delete an address entry from the `ADDRESSES_TABLE`
  /// using the given [addressId]. If the deletion is successful, it reloads the
  /// addresses list to reflect the changes in the UI. If an error occurs during
  /// the deletion process, an error message is logged and a notification is shown.

  Future<void> dateAddress(int addressId) async {
    debugPrint('Updating address...');
    bool result = await _main.shouldDeleteAddress();
    if (!result) return; // User chose not to delete the address
    try {
      // Update the address in the database
      await _supabase.from(KEYS.ADDRESSES_TABLE).delete().eq('id', addressId);
      addresses.removeWhere((address) => address.id == addressId);
      update(); // Notify listeners about the change
    } catch (error) {
      // Handle errors and show error notification
      // CustomNotification.showSnackbar(message: AppConstants.DATA_UPDATING_ERROR);
      debugPrint(error.toString());
    } finally {
      // Reload addresses after updating
      // await loadAddresses();
    }
  }
}
