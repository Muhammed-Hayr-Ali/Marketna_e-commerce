import 'package:application/utils/import.dart';

class CountryPickerController extends GetxController {


  final _supabase = Supabase.instance.client;
  final _storage = GetStorage();

  /// This controller is used to manage the country picker widget.
  final RxBool _isLoading = false.obs;
  final RxList<CountryModel> _countries = <CountryModel>[].obs;
  final RxList<Province> _provinces = <Province>[].obs;
  final RxList<City> _cities = <City>[].obs;

  ///
  final Rxn<CountryModel> _selectedCountry = Rxn<CountryModel>();
  final Rxn<Province> _selectedProvince = Rxn<Province>();
  final Rxn<City> _selectedCity = Rxn<City>();

  ///
  bool get isLoading => _isLoading.value;
  List<CountryModel> get countries => _countries.toList();
  List<Province> get provinces => _provinces.toList();
  List<City> get cities => _cities.toList();
  CountryModel? get selectedCountry => _selectedCountry.value;
  Province? get selectedProvince => _selectedProvince.value;
  City? get selectedCity => _selectedCity.value;

  @override
  void onClose() {
    super.onClose();
    _countries.clear();
    _provinces.clear();
    _cities.clear();
    _selectedCountry.value = null;
    _selectedProvince.value = null;
    _selectedCity.value = null;
  }

  Future <void> loadInitCountry (String? initCountryCode) async {
    if (initCountryCode != null) {
      await loadCountries();
      _countries.assignAll(
        _countries.where((country) => country.code == initCountryCode),
      );
    }
  }

  /// [localCode] is a method that returns the local code of the device.

  String localCode() {
    String? locale = _storage.read('locale');
    if (locale == null || locale.isEmpty || locale == 'auto') {
      return Get.deviceLocale!.languageCode;
    }
    return locale;
  }

  /// [loadCountries] is a method that fetches the countries from the database.
  Future<bool> loadCountries() async {
    _isLoading.value = true;
    try {
      final countryResponse = await _supabase
          .from('countries')
          .select()
          .order('name');
      final countries =
          countryResponse.map((json) => CountryModel.fromJson(json)).toList();
      _countries.assignAll(countries);
      return _countries.isNotEmpty;
    } on Object catch (error) {
      debugPrint(error.toString());
      rethrow;
    } finally {
      _isLoading.value = false;
    }
  }

  void updateCountry(CountryModel value) {
    _selectedCountry.value = value;
    _provinces.assignAll(value.province ?? []);
    _cities.clear();
    _selectedProvince.value = null;
    _selectedCity.value = null;
  }

  void updateProvince(Province value) {
    _selectedProvince.value = value;
    _cities.assignAll(value.city ?? []);
    _selectedCity.value = null;
  }

  void updateCity(City value) {
    _selectedCity.value = value;
  }
}
