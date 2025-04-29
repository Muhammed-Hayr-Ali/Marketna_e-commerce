import 'package:application/utils/import.dart';
import 'package:application/utils/storage_key.dart';

enum CountryPickerMode { address, code }


class CustomCountryPicker extends StatefulWidget {
  const CustomCountryPicker({
    super.key,

    required this.countryPickerMode,

    this.onChangedCountry,
    this.onChangedProvince,
    this.onChangedCity,

    this.selectedCountry,
    this.selectedCountryCode,
    this.selectedCountryFlag,
    this.selectedProvince,
    this.selectedCity,

    this.countryErrorMessage,
    this.countryCodeErrorMessage,
    this.provinceErrorMessage,
    this.cityErrorMessage,
  });

  final CountryPickerMode countryPickerMode;
  final String? selectedCountry;
  final String? selectedCountryCode;
  final String? selectedCountryFlag;
  final String? selectedProvince;
  final String? selectedCity;
  final String? countryErrorMessage;
  final String? countryCodeErrorMessage;
  final String? provinceErrorMessage;
  final String? cityErrorMessage;
  final void Function(Country)? onChangedCountry;
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

  List<Country> countries = [];
  List<Province> provinces = [];
  List<City> city = [];

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
        countries = response.map((data) => Country.fromJson(data)).toList();
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
  void _onCountryChanged(Country selectedCountry) {
    widget.onChangedCountry?.call(selectedCountry);
    provinces = selectedCountry.province ?? [];
    city = [];
    Get.back();
  }

  /// On province changed
  /// This function is called when a province is selected from the picker.
  void _onProvinceChanged(Province province) {
    widget.onChangedProvince?.call(province);
    city = province.city ?? [];
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
  void _openCountrypicker() async {
    /// Check if countries are loaded, if not load them
    if (countries.isEmpty) {
      bool result = await _loadCountries();
      if (!result) {
        return;
      }
    }

    /// open country picker
    custombottomSheet(
      title: 'select_country',
      children: [
        Flexible(
          child: ListView.builder(
            itemCount: countries.length,
            itemBuilder:
                (context, index) => TextButton(
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
  void _openProvincePicker() {
    /// Check if provinces are loaded, if not load them
    if (provinces.isEmpty || widget.selectedCountry == null) return;

    /// open province picker
    custombottomSheet(
      title: 'select_province',
      children: [
        Flexible(
          child: ListView.builder(
            itemCount: provinces.length,
            itemBuilder:
                (context, index) => TextButton(
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
    if (city.isEmpty || widget.selectedProvince == null) {
      return;
    }

    /// open city picker
    custombottomSheet(
      title: 'select_city',
      children: [
        Flexible(
          child: ListView.builder(
            itemCount: city.length,
            itemBuilder:
                (context, index) => TextButton(
                  onPressed: () => _onCityChanged(city[index]),
                  child: Row(children: [CustomText(city[index].name ?? '')]),
                ),
          ),
        ),
      ],
    );
  }

  /// Code mode picker
  /// This widget is used to select a country code.
  Widget _pickerCodeMode() {
    return CustomButton(
      label: 'countryCode',
      errorMessage: widget.countryCodeErrorMessage,
      isLoading: isLoading,
      onPressed: _openCountrypicker,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Transform.translate(
          offset: Offset(-1, 1),
          child: CustomText(
            widget.selectedCountryCode ?? '963',
            fontWeight: FontWeight.w500,
            color:
                widget.selectedCountryCode == null
                    ? Colors.grey.shade400
                    : Colors.black,
          ),
        ),
      ),
    );
  }

  /// Address mode picker
  /// This widget is used to select the country, province, and city for an address.
  Widget _pickerAddressMode() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///country
        CustomButton(
          label: 'country',
          errorMessage: widget.countryErrorMessage,
          isLoading: isLoading,
          width: double.infinity,
          onPressed: _openCountrypicker,
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
                  CustomText(widget.selectedCountry ?? 'select_country'),
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
                  label: 'state/province',
                  errorMessage: widget.provinceErrorMessage,
                  width: double.infinity,
                  onPressed: _openProvincePicker,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(widget.selectedProvince ?? 'select_province'),

                      Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: CustomButton(
                  label: 'city',
                  errorMessage: widget.cityErrorMessage,
                  width: double.infinity,
                  onPressed: _openCityPicker,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(widget.selectedCity ?? 'select_city'),
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

  @override
  Widget build(BuildContext context) {
    return widget.countryPickerMode == CountryPickerMode.code
        ? _pickerCodeMode()
        : _pickerAddressMode();
  }
}
