import 'package:application/utils/import.dart';

enum CountryPickerMode { address, code }

class CustomCountryPicker extends StatefulWidget {
  const CustomCountryPicker({
    super.key,
    required this.countryPickerMode,
    this.showProvince = true,
    this.showCity = true,
    this.countryLabel,
    this.provinceLabel,
    this.cityLabel,
    this.countryHint,
    this.provinceHint,
    this.cityHint,
    this.onChangedCountry,
    this.onChangedProvince,
    this.onChangedCity,
    this.showCountryCodeList = true,
    this.showCountryCodeHint = true,
    this.initCode,
    this.codeLabel,
    this.initCountry,
    this.initProvince,
    this.initCity,
  });

  final CountryPickerMode countryPickerMode;
  final bool showCountryCodeList;
  final bool showCountryCodeHint;
  final bool showProvince;
  final bool showCity;

  final String? initCode;
  final String? initCountry;
  final String? initProvince;
  final String? initCity;

  final String? codeLabel;
  final String? countryLabel;
  final String? provinceLabel;
  final String? cityLabel;

  final String? countryHint;
  final String? provinceHint;
  final String? cityHint;

  final void Function({String? name, String? code, String? flag})?
  onChangedCountry;
  final void Function(String)? onChangedProvince;
  final void Function(String)? onChangedCity;

  @override
  State<CustomCountryPicker> createState() => _CustomCountryPickerState();
}

class _CustomCountryPickerState extends State<CustomCountryPicker> {
  final _supabase = Supabase.instance.client;
  final GetStorage storage = GetStorage();
  String? local;
  bool isLoading = false;

  CountryModel? selectedCountry;
  Province? selectedProvince;
  City? selectedCity;

  List<CountryModel> countries = [];
  List<Province> provinces = [];
  List<City> city = [];

  String? selectedCountryName;
  String? selectedProvinceName;
  String? selectedCityName;

  Future<bool> _loadCountries() async {
    setState(() {
      isLoading = true;
    });
    local = storage.read('locale') ?? Get.deviceLocale!.languageCode;

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
      selectedCountry = value;
      provinces = value.province ?? [];
      city = [];
      selectedProvince = null;
      selectedCity = null;
      selectedProvinceName = null;
      selectedCityName = null;
      selectedCountryName = (local == 'ar' ? value.nameAr : value.name) ?? '';
    });
    widget.onChangedCountry?.call(
      code: value.code ?? '',
      name: selectedCountryName ?? '',
      flag: value.flag ?? '',
    );

    Navigator.pop(context);
  }

  void _updateProvince(BuildContext context, Province value) {
    setState(() {
      selectedProvince = value;
      city = value.city ?? [];
      selectedCity = null;
      selectedCityName = null;

      selectedProvinceName = (local == 'ar' ? value.nameAr : value.name) ?? '';
    });
    widget.onChangedProvince?.call(selectedProvinceName ?? '');
    Navigator.pop(context);
  }

  void _updateCity(City value) {
    setState(() {
      selectedCity = value;
      selectedCityName = value.name ?? '';
    });
    widget.onChangedCity?.call(selectedCityName ?? '');
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
      label: widget.codeLabel ?? '',
      isLoading: isLoading,
      onPressed: _openCountry,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Transform.translate(
          offset: Offset(-1, 1),
          child:
              selectedCountry != null
                  ? CustomText(
                    selectedCountry!.code!,
                    fontWeight: FontWeight.w500,
                  )
                  : CustomText(
                    widget.initCode == '' || widget.initCode == null
                        ? '+963'
                        : widget.initCode!,
                    fontWeight: FontWeight.w500,
                    color:
                        widget.initCode == '' || widget.initCode == null
                            ? Colors.grey
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
        ///Label
        CustomText(
          widget.cityLabel ?? 'country',
          fontSize: 12,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),

        ///country
        CustomButton(
          isLoading: isLoading,
          width: double.infinity,
          onPressed: _openCountry,
          child:
              selectedCountry != null &&
                      selectedCountry!.name != null &&
                      selectedCountry!.name != ''
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: Image.asset(
                              selectedCountry!.flag!,
                              width: 20,
                            ),
                          ),
                          SizedBox(width: 8),
                          CustomText(selectedCountryName ?? ''),
                        ],
                      ),
                      widget.showCountryCodeHint
                          ? Directionality(
                            textDirection: TextDirection.ltr,
                            child: CustomText(selectedCountry!.code ?? ''),
                          )
                          : SizedBox(),
                    ],
                  )
                  : widget.initCountry != null && widget.initCountry != ''
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(widget.initCountry!),
                      Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                  )
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(widget.countryHint ?? 'select_country'),
                      Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                  ),
        ),

        ///province + city
        SizedBox(height: widget.showProvince != false ? 16 : 0),
        SizedBox(
          child:
              widget.showProvince != false
                  ? Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ///Label
                            CustomText(
                              widget.provinceLabel ?? 'state/province',
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                            CustomButton(
                              width: double.infinity,
                              onPressed: _openProvince,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    selectedProvinceName ??
                                        widget.initProvince ??
                                        widget.provinceHint ??
                                        'select_province',
                                  ),

                                  Icon(Icons.keyboard_arrow_down_rounded),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: widget.showCity != false ? 16 : 0),
                      widget.showCity != false
                          ? Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ///Label
                                CustomText(
                                  widget.cityLabel ?? 'city',
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                                CustomButton(
                                  width: double.infinity,
                                  onPressed: _openCity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        selectedCityName ??
                                            widget.initCity ??
                                            widget.cityHint ??
                                            'select_city',
                                      ),
                                      Icon(Icons.keyboard_arrow_down_rounded),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                          : SizedBox.shrink(),
                    ],
                  )
                  : null,
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
