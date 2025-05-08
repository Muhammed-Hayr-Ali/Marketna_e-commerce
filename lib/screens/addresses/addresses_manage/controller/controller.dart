import 'package:application/constants/import.dart';

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
      throw NotificationMessage.userNull;
    }

    try {
      // Query the database for addresses linked to the current user
      final response = await _supabase
          .from(TableNames.addresses)
          .select()
          .eq(ColumnNames.userId, currentUser.id);

      // Check if the response is empty
      if (response.isEmpty) {
        return;
      }

      // Update the addresses list with the fetched data
      addresses = List<AddressModel>.from(
        response.map((address) => AddressModel.fromJson(address)),
      );
      // Update the state to notify listeners
    } on Exception catch (e) {
      CustomNotification.showSnackbar(message: e.toString());
      debugPrint(e.toString());
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
      await _supabase
          .from(TableNames.addresses)
          .delete()
          .eq(ColumnNames.id, addressId);
      addresses.removeWhere((address) => address.id == addressId);
      CustomNotification.showSnackbar(
        message: NotificationMessage.addressDeletedSuccess,
      );
      update(); // Notify listeners about the change
    } catch (error) {
      // Handle errors and show error notification
      CustomNotification.showSnackbar(
        message: NotificationMessage.somethingWentWrong,
      );
      debugPrint(error.toString());
    }
  }
}
