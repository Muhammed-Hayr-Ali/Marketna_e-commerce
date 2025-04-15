import 'package:get_storage/get_storage.dart';

class AppStorage {



  final storage = GetStorage();




  /// Writes a value to local storage.
  ///
  /// Throws an exception if the operation fails.
  Future<void> write({required String key, required dynamic value}) async {
    try {
      await storage.write(key, value);
    } catch (e) {
      throw Exception('Failed to write to local storage with key "$key": $e');
    }
  }

  /// Reads a value from local storage.
  ///
  /// Returns the stored value if it exists and matches the expected type [T].
  /// Otherwise, returns the [defaultValue].
  Future<T?> read<T>({required String key, T? defaultValue}) async {
    try {
      final value = storage.read(key);
      if (value is T) {
        return value;
      } else {
        return defaultValue;
      }
    } catch (e) {
      throw Exception('Failed to read from local storage with key "$key": $e');
    }
  }

  /// Deletes a value from local storage.
  ///
  /// Throws an exception if the operation fails.
  Future<void> delete({required String key}) async {
    try {
      await storage.remove(key);
    } catch (e) {
      throw Exception(
        'Failed to delete from local storage with key "$key": $e',
      );
    }
  }

  /// Clears all data from local storage.
  ///
  /// Throws an exception if the operation fails.
  Future<void> clear() async {
    try {
      await storage.erase();
    } catch (e) {
      throw Exception('Failed to clear local storage: $e');
    }
  }
}
