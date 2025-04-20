import 'package:application/utils/import.dart';

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
  final void Function(CountryModel)? onChangedCountry;
  final void Function(Province)? onChangedProvince;
  final void Function(City)? onChangedCity;

  /// Error: The argument type 'String?' can't be assigned to the parameter type 'String'.

  final String? selectedCountry;
  final String? selectedCountryCode;
  final String? selectedCountryFlag;
  final String? selectedProvince;
  final String? selectedCity;

  final String? countryErrorMessage;
  final String? countryCodeErrorMessage;
  final String? provinceErrorMessage;
  final String? cityErrorMessage;

  @override
  State<CustomCountryPicker> createState() => _CustomCountryPickerState();
}

class _CustomCountryPickerState extends State<CustomCountryPicker> {
  /// Initialize Supabase client
  final _supabase = Supabase.instance.client;

  /// Initialize GetStorage for local storage
  final GetStorage storage = GetStorage();

  /// Initialize local variable for locale
  String? local;

  /// Initialize isLoading variable for loading state
  bool isLoading = false;

  /// Initialize selectedCountry, selectedProvince, and selectedCity variables
  bool isCountrySelected = false;

  Province? selectedProvince;
  City? selectedCity;

  List<CountryModel> countries = [];
  List<Province> provinces = [];
  List<City> city = [];

  Future<bool> _loadCountries() async {
    setState(() {
      isLoading = true;
    });
    local =
        storage.read(AppStorageKey.LOCALE) ?? Get.deviceLocale!.languageCode;

    try {
      final response = await _supabase.from('countries').select().order('name');
      setState(() {
        countries = response.map((e) => CountryModel.fromJson(e)).toList();
      });

      if (countries.isNotEmpty) return true;
      return false;
    } catch (error) {
      debugPrint(error.toString());
      return false;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _updateCountry(BuildContext context, CountryModel value) {
    setState(() {
      provinces = value.province ?? [];
      city = [];
      selectedProvince = null;
      selectedCity = null;
    });
    widget.onChangedCountry?.call(value);

    Navigator.pop(context);
  }

  void _updateProvince(BuildContext context, Province value) {
    setState(() {
      selectedProvince = value;
      city = value.city ?? [];
      selectedCity = null;
    });
    widget.onChangedProvince?.call(value);
    Navigator.pop(context);
  }

  void _updateCity(City value) {
    setState(() {
      selectedCity = value;
    });
    widget.onChangedCity?.call(value);
    Get.back();
  }

  void _openCountry() async {
    if (countries.isEmpty) {
      final result = await _loadCountries();
      if (!result) return;
    }

    custombottomSheet(
      title: 'select_country',
      children: [
        Flexible(
          child: ListView.builder(
            itemCount: countries.length,
            itemBuilder:
                (context, index) => TextButton(
                  onPressed: () {
                    _updateCountry(context, countries[index]);
                  },
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

  void _openProvince() {
    if (provinces.isEmpty) return;
    custombottomSheet(
      title: 'select_province',
      children: [
        Flexible(
          child: ListView.builder(
            itemCount: provinces.length,
            itemBuilder:
                (context, index) => TextButton(
                  onPressed: () {
                    _updateProvince(context, provinces[index]);
                  },
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

  void _openCity() {
    if (city.isEmpty) return;
    custombottomSheet(
      title: 'select_city',
      children: [
        Flexible(
          child: ListView.builder(
            itemCount: city.length,
            itemBuilder:
                (context, index) => TextButton(
                  onPressed: () {
                    _updateCity(city[index]);
                  },
                  child: Row(children: [CustomText(city[index].name ?? '')]),
                ),
          ),
        ),
      ],
    );
  }

  Widget _pickerCodeMode() {
    return CustomButton(
      label: 'countryCode',
      errorMessage: widget.countryCodeErrorMessage,
      isLoading: isLoading,
      onPressed: _openCountry,
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
          onPressed: _openCountry,
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
                  onPressed:
                      widget.selectedCountry != null ? _openProvince : null,
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
                  onPressed:
                      widget.selectedCountry != null &&
                              widget.selectedProvince != null
                          ? _openCity
                          : null,
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
