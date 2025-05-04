import 'package:application/utils/import.dart';

class CustomCountryPicker extends StatefulWidget {
  const CustomCountryPicker({
    super.key,

    this.onChangedCountry,
    this.onChangedProvince,
    this.onChangedCity,

    this.selectedCountry,
    this.selectedCountryCode,
    this.selectedCountryFlag,
    this.selectedProvince,
    this.selectedCity,

    this.countryErrorMessage,
    this.provinceErrorMessage,
    this.cityErrorMessage,
  });

  final String? selectedCountry;
  final String? selectedCountryCode;
  final String? selectedCountryFlag;
  final String? selectedProvince;
  final String? selectedCity;
  final String? countryErrorMessage;
  final String? provinceErrorMessage;
  final String? cityErrorMessage;
  final void Function(CountryModel)? onChangedCountry;
  final void Function(Province)? onChangedProvince;
  final void Function(City)? onChangedCity;

  @override
  State<CustomCountryPicker> createState() => _CustomCountryPickerState();
}

class _CustomCountryPickerState extends State<CustomCountryPicker> {
  /// Variables
  final _supabase = Supabase.instance.client;
  final GetStorage _storage = GetStorage();
  String? local;
  bool isLoading = false;

  List<CountryModel> countries = [];
  List<Province> provinces = [];
  List<City> cities = [];

  /// Functions
  /// Load countries
  Future<bool> _loadCountries() async {
    setState(() {
      isLoading = true;
    });

    // Retrieve locale from storage or default to device locale
    local =
        _storage.read(STORAGE_KEYS.LOCALE) ??
        Get.deviceLocale?.languageCode ??
        'en';

    try {
      // Fetch countries sorted by name from the database
      final List<dynamic> response = await _supabase.from('countries').select();

      // Return false if no countries are found
      if (response.isEmpty) return false;

      setState(() {
        // Convert response to a list of Country instances
        countries =
            response.map((data) => CountryModel.fromJson(data)).toList();
      });

      return true;
    } catch (e) {
      return false;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  /// On country changed
  /// This function is called when a country is selected from the picker.
  void _onCountryChanged(CountryModel selectedCountry) {
    widget.onChangedCountry?.call(selectedCountry);
    provinces = selectedCountry.province ?? [];
    cities = [];
    Get.back();
  }

  /// On province changed
  /// This function is called when a province is selected from the picker.
  void _onProvinceChanged(Province province) {
    widget.onChangedProvince?.call(province);
    // cities = province.city ?? [];
    if (province.city != null && province.city!.isNotEmpty) {
      cities = province.city!;
    } else {
      String provinceName =
          (local == 'ar' ? province.nameAr : province.name) ?? 'null';
      cities = [City(name: provinceName)];
    }
    Get.back();
  }

  /// On city changed
  /// This function is called when a city is selected from the picker.
  void _onCityChanged(City city) {
    widget.onChangedCity?.call(city);
    Get.back();
  }

  /// Open Country picker
  /// This function is called when the country button is pressed.
  /// It opens a bottom sheet with a list of countries to select from.
  void _openCountrypicker(String? country) async {
    /// Check if countries are loaded, if not load them
    if (countries.isEmpty) {
      bool result = await _loadCountries();
      if (!result) {
        return;
      }
    }

    /// open country picker
    custombottomSheet(
      children: [
        CustomPageTitle(
          title: 'Select Country',
          subtitle: 'Select your country from the list below',
        ),
        Divider(),

        Flexible(
          child: ListView.builder(
            itemCount: countries.length,
            itemBuilder:
                (context, index) => TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        country == countries[index].code
                            ? Colors.grey.shade200
                            : Colors.white,
                  ),
                  onPressed: () => _onCountryChanged(countries[index]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: Image.asset(
                              countries[index].flag ?? '',
                              width: 22,
                            ),
                          ),
                          SizedBox(width: 8),
                          CustomText(
                            (local == 'ar'
                                    ? countries[index].nameAr
                                    : countries[index].name) ??
                                '',
                          ),
                        ],
                      ),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: CustomText(countries[index].code ?? ''),
                      ),
                    ],
                  ),
                ),
          ),
        ),
      ],
    );
  }

  /// Open Province picker
  /// This function is called when the province button is pressed.
  /// It opens a bottom sheet with a list of provinces to select from.
  void _openProvincePicker(String? province) {
    /// Check if provinces are loaded, if not load them
    if (provinces.isEmpty || widget.selectedCountry == null) return;

    /// open province picker
    custombottomSheet(
      children: [
        CustomPageTitle(
          title: 'Select Province',
          subtitle: 'Select your province from the list below',
        ),
        Divider(),

        Flexible(
          child: ListView.builder(
            itemCount: provinces.length,
            itemBuilder:
                (context, index) => TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        province == provinces[index].nameAr ||
                                province == provinces[index].name
                            ? Colors.grey.shade200
                            : Colors.white,
                  ),

                  onPressed: () => _onProvinceChanged(provinces[index]),
                  child: Row(
                    children: [
                      CustomText(
                        (local == 'ar'
                                ? provinces[index].nameAr
                                : provinces[index].name) ??
                            '',
                      ),
                    ],
                  ),
                ),
          ),
        ),
      ],
    );
  }

  /// Open City picker
  /// This function is called when the city button is pressed.
  /// It opens a bottom sheet with a list of cities to select from.
  void _openCityPicker() {
    /// Check if cities are loaded, if not load them
    if (cities.isEmpty || widget.selectedProvince == null) {
      return;
    }

    /// open city picker
    custombottomSheet(
      children: [
        CustomPageTitle(
          title: 'Select City',
          subtitle: 'Select your city from the list below',
        ),
        Divider(),

        Flexible(
          child: ListView.builder(
            itemCount: cities.length,
            itemBuilder:
                (context, index) => TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        'city' == cities[index].name
                            ? Colors.grey.shade200
                            : Colors.white,
                  ),

                  onPressed: () => _onCityChanged(cities[index]),
                  child: Row(children: [CustomText(cities[index].name ?? '')]),
                ),
          ),
        ),
      ],
    );
  }

  /// Address mode picker
  /// This widget is used to select the country, province, and city for an address.

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///country
        CustomButton(
          label: 'Country',
          backgroundColor: AppColors.grey,
          errorMessage: widget.countryErrorMessage,
          isLoading: isLoading,
          onPressed: () => _openCountrypicker(widget.selectedCountryCode),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                    child:
                        widget.selectedCountryFlag != null
                            ? ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: Image.asset(
                                widget.selectedCountryFlag!,
                                width: 20,
                              ),
                            )
                            : Icon(
                              Icons.flag,
                              size: 20,
                              color: Colors.grey.shade400,
                            ),
                  ),
                  SizedBox(width: 8),
                  CustomText(widget.selectedCountry ?? 'Select Country'),
                ],
              ),
              Icon(Icons.keyboard_arrow_down_rounded),
            ],
          ),
        ),

        ///province + city
        SizedBox(height: 16),
        SizedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomButton(
                  label: 'State / Province',
                  backgroundColor: AppColors.grey,
                  errorMessage: widget.provinceErrorMessage,
                  onPressed:
                      () =>
                          widget.selectedCountry == null
                              ? _openCountrypicker(widget.selectedCountryCode)
                              : _openProvincePicker(widget.selectedProvince),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: CustomText(
                          widget.selectedProvince ?? 'Select Province',
                        ),
                      ),

                      Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: CustomButton(
                  label: 'City',
                  errorMessage: widget.cityErrorMessage,
                  backgroundColor: AppColors.grey,
                  onPressed:
                      () =>
                          widget.selectedCountry == null
                              ? _openCountrypicker(widget.selectedCountryCode)
                              : widget.selectedProvince == null
                              ? _openProvincePicker(widget.selectedProvince)
                              : _openCityPicker(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: CustomText(widget.selectedCity ?? 'Select City'),
                      ),
                      Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
