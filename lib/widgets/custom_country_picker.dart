import 'package:application/constants/import.dart';

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
    this.countryHintText,
    this.provinceHintText,
    this.cityHintText,
  });

  final String? selectedCountry,
      selectedCountryCode,
      selectedCountryFlag,
      selectedProvince,
      selectedCity;
  final String? countryErrorMessage, provinceErrorMessage, cityErrorMessage;
  final String? countryHintText, provinceHintText, cityHintText;
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
  // String? local;
  bool isLoading = false;

  List<CountryModel> countries = [];
  List<Province> provinces = [];
  List<City> cities = [];

  /// Retrieves the locale setting from storage or defaults to the device locale.
  String _getLocale() {
    final deviceLocale = Get.deviceLocale!.languageCode;
    String locale =
        _storage.read<String>(StorageKeys.localeCode) ?? deviceLocale;

    if (locale == FieldValues.auto) {
      locale = deviceLocale;
    }
    return locale;
  }

  /// Load countries
  Future<bool> _loadCountries() async {
    setState(() {
      isLoading = true;
    });

    // Retrieve locale from storage or default to device locale
    try {
      // Fetch countries sorted by name from the database
      final List<dynamic> response =
          await _supabase.from(TableNames.countries).select();

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
    provinces = selectedCountry.province!;
    cities = [];
    Get.back();
  }

  /// On province changed
  /// This function is called when a province is selected from the picker.
  void _onProvinceChanged(Province selectedProvince) {
    final provinceName =
        _getLocale() != FieldValues.ar
            ? selectedProvince.name
            : selectedProvince.nameAr;

    if (selectedProvince.city == null || selectedProvince.city!.isEmpty) {
      cities = [City(name: provinceName)];
    } else {
      cities = selectedProvince.city!;
    }

    widget.onChangedProvince?.call(selectedProvince);
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
          title: AppStrings.selectCountry,
          subtitle: AppStrings.selectCountrySubTitle,
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
                            (_getLocale() == FieldValues.ar
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
          title: AppStrings.selectProvince,
          subtitle: AppStrings.selectProvinceSubTitle,
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
                        (_getLocale() == FieldValues.ar
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
  void _openCityPicker(String? city) {
    /// Check if cities are loaded, if not load them
    if (cities.isEmpty || widget.selectedProvince == null) {
      return;
    }

    /// open city picker
    custombottomSheet(
      children: [
        CustomPageTitle(
          title: AppStrings.selectCity,
          subtitle: AppStrings.selectCitySubTitle,
        ),
        Divider(),

        Flexible(
          child: ListView.builder(
            itemCount: cities.length,
            itemBuilder:
                (context, index) => TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        city == cities[index].name
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
          label: AppStrings.country,
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
                  CustomText(
                    widget.selectedCountry ?? AppStrings.selectCountry,
                  ),
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
                  label: AppStrings.selectProvince,
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
                          widget.selectedProvince ?? AppStrings.selectProvince,
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
                  label: AppStrings.city,
                  errorMessage: widget.cityErrorMessage,
                  backgroundColor: AppColors.grey,
                  onPressed:
                      () =>
                          widget.selectedCountry == null
                              ? _openCountrypicker(widget.selectedCountryCode)
                              : widget.selectedProvince == null
                              ? _openProvincePicker(widget.selectedProvince)
                              : _openCityPicker(widget.selectedCity),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: CustomText(
                          widget.selectedCity ?? AppStrings.selectCity,
                        ),
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
