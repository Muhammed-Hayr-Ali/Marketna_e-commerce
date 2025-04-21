import 'package:application/utils/import.dart';

class UploadData {
  UploadData._();
  final _supabase = Supabase.instance.client;

  Future<void> loadCountries(String filePath) async {
    try {
      debugPrint('Loading data...');

      /// Load the JSON data from the assets folder
      final String jsonData = await rootBundle.loadString(filePath);

      debugPrint('Checking if data is empty...');

      /// Check if the JSON data is empty
      if (jsonData.isEmpty) {
        debugPrint('Json data file is empty.');
        return;
      }

      debugPrint('Decoding JSON data...');

      /// Decode the JSON data
      final List<dynamic> jsonList = jsonDecode(jsonData);
      debugPrint('JSON data decoded successfully.');

      debugPrint('Inserting data into Supabase...');

      /// Insert each data into the Supabase table
      for (final Map<String, dynamic> data in jsonList) {
        await _supabase.from('countries').insert(data);
      }
      debugPrint('Data inserted successfully.');
    } catch (e) {
      debugPrint('Error uploading data: $e');
    }
  }
}
