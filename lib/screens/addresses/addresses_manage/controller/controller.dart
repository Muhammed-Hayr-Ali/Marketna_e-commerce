import 'package:application/utils/import.dart';

class ManageAddressesController extends GetxController {
  final _supabase = Supabase.instance.client;
  final _main = ManageAddressesMainController();
  bool isLoading = true;
  List<AddressModel> addresses = [];

  @override
  void onInit() {
    loadAddresses();
    super.onInit();
  }

  /// Loads the addresses for the current user.
  Future<void> loadAddresses() async {
    final currentUser = _supabase.auth.currentUser;

    if (currentUser == null) {
      throw AppException('user ID is null. Cannot load addresses.');
    }

    try {
      // Query the database for addresses linked to the current user
      final response = await _supabase
          .from(KEYS.ADDRESSES_TABLE)
          .select()
          .eq(KEYS.USER_ID, currentUser.id);

      // Check if the response is empty
      if (response.isEmpty) {
        return;
      }

      // Update the addresses list with the fetched data
      addresses = List<AddressModel>.from(
        response.map((address) => AddressModel.fromJson(address)),
      );
      // Update the state to notify listeners
    } on AppException catch (error) {
      CustomNotification.showSnackbar(message: error.message);
    } on Exception {
      CustomNotification.showSnackbar(
        message:
            'Something has gone wrong somewhere, and we will try to fix it right away.',
      );
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> dateAddress(int addressId, String addressName) async {

    bool result = await _main.shouldDeleteAddress(addressName);
    if (!result) return; // User chose not to delete the address
    try {
      // Update the address in the database
      await _supabase.from(KEYS.ADDRESSES_TABLE).delete().eq('id', addressId);
      addresses.removeWhere((address) => address.id == addressId);
      CustomNotification .showSnackbar(message: 'Address deleted successfully.');
      update(); // Notify listeners about the change
    } catch (error) {
      // Handle errors and show error notification
      CustomNotification.showSnackbar(message: 'Something has gone wrong somewhere, and we will try to fix it right away.');
      debugPrint(error.toString());
    } 
  }
}
