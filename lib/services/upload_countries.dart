import 'package:application/utils/import.dart';

class UploadCountriesController extends GetxController {
  final _supabase = Supabase.instance.client;

  RxBool isLoading = false.obs;
  RxString message = ''.obs;

  List<CountryModel> countries = [];
  List<Province> provinces = [];
  List<City> city = [];

  Future<void> loadCountries() async {
    isLoading(true);
    try {
      String jsonString = await rootBundle.loadString(
        'assets/data/countries.json',
      );

      List<dynamic> jsonList = json.decode(jsonString);
      countries = jsonList.map((json) => CountryModel.fromJson(json)).toList();
      if (countries.isNotEmpty) {
        for (var country in countries) {
          await _supabase.from('countries').insert(country.toJson());

          // if (country.province!.isNotEmpty) {
          //   for (var province in country.province!) {
          //     await _supabase.from('provinces').insert(province.toJson());

          //     if (province.city!.isNotEmpty) {
          //       for (var city in province.city!) {
          //         await _supabase.from('cities').insert(city.toJson());
          //       }
          //     }
          //   }
          // }
        }
      }
      debugPrint('Countries loaded successfully');
      message = 'Countries loaded successfully'.obs;
    } catch (e) {
      debugPrint(e.toString());
      message = e.toString().obs;
    } finally {
      isLoading(false);
    }
  }
}
