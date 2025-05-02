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


  Future<void> dateAddress(int addressId, String addressName) async {
    debugPrint('Updating address...');
    bool result = await _main.shouldDeleteAddress(addressName);
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
