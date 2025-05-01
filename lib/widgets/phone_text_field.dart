import 'package:application/utils/import.dart';

class PhoneTextFieldController extends GetxController {
  final SupabaseClient _supabase = Supabase.instance.client;
  final GetStorage _storage = GetStorage();

  /// The list of country codes.
  final RxList<Country> countries = RxList<Country>([]);

  /// The loading state.
  final RxBool isLoading = false.obs;

  String getLocalCode() {
    final locale = _storage.read(STORAGE_KEYS.LOCALE);
    return locale ?? Get.deviceLocale?.languageCode ?? 'en';
  }

  Future<List<Country>?> fetchCountryCodes() async {
    try {
      isLoading.value = true;
      debugPrint('Fetching country codes...');
      final response = await _supabase.from(KEYS.COUNTRIES_TABLE).select();

      /// Check if the response is not null and contains data
      if (response.isEmpty) {
        throw 'No country codes found.';
      }

      /// Map the response to a list of Country objects
      return response.map<Country>((item) {
        return Country.fromJson(item);
      }).toList();
    } catch (e) {
      debugPrint('Error fetching country codes: $e');
      return null;
    } finally {
      isLoading.value = false;
    }
  }

  Future<String?> openCountryPicker() async {
    final List<Country> countriesList;
    if (countries.isNotEmpty) {
      countriesList = countries;
    } else {
      final result = await fetchCountryCodes() ?? [];
      countries.value = result;
      countriesList = result;
    }

    if (countriesList.isEmpty) {
      return null;
    }

    String result =
        await custombottomSheet(
          title: 'select_country',
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: countriesList.length,
                itemBuilder:
                    (context, index) => TextButton(
                      onPressed:
                          () => Get.back(result: countriesList[index].code),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(2),
                                child: Image.asset(
                                  countriesList[index].flag ?? '',
                                  width: 22,
                                ),
                              ),
                              SizedBox(width: 8),
                              CustomText(
                                (getLocalCode() == 'ar'
                                        ? countriesList[index].nameAr
                                        : countriesList[index].name) ??
                                    '',
                              ),
                            ],
                          ),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: CustomText(countriesList[index].code ?? ''),
                          ),
                        ],
                      ),
                    ),
              ),
            ),
          ],
        ) ??
        '';
    return result;
  }
}

class PhoneTextField extends StatelessWidget {
  final bool enableCode;
  final String hintPhone;
  final String hintCode;
  final String labelText;
  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? selectedCode;
  final void Function(String?)? onSelectedCode;
  final TextEditingController? phoneController;
  final String? errorMessage;
  final String? disableMessage;

  PhoneTextField({
    super.key,
    this.enableCode = true,
    this.hintPhone = '987654321',
    this.hintCode = '+963',
    this.labelText = 'phone',
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.selectedCode,
    this.onSelectedCode,
    this.phoneController,
    this.errorMessage,
    this.disableMessage,
  });

  final _ = Get.put(PhoneTextFieldController());

  Widget _clearTextWidget() {
    return Transform.translate(
      offset: const Offset(0, 2),
      child: GestureDetector(
        onTap: phoneController!.clear,
        child: Icon(Icons.cancel, size: 16, color: Colors.grey.shade400),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText.tr,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6.0),
        Container(
          height: 48,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Obx(
                    () => TextButton(
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 14,
                        ),
                        minimumSize: const Size(0, 0),
                      ),
                      onPressed:
                          enableCode == true
                              ? () {
                                final result = _.openCountryPicker();
                                result.then((value) {
                                  if (onSelectedCode != null) {
                                    onSelectedCode!.call(value!);
                                  }
                                });
                              }
                              : disableMessage != null
                              ? () {
                                CustomNotification.showSnackbar(
                                  message: disableMessage!,
                                );
                              }
                              : null,
                      child:
                          _.isLoading.value
                              ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 1.5,
                                ),
                              )
                              : selectedCode != null && selectedCode != ''
                              ? Text(
                                selectedCode!,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: fontSize ?? 14,
                                  fontWeight: fontWeight ?? FontWeight.w500,
                                ),
                              )
                              : Text(
                                hintCode,
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: fontSize ?? 14,
                                  fontWeight: fontWeight ?? FontWeight.w500,
                                ),
                              ),
                    ),
                  ),
                ),
                Container(height: 20, width: 1, color: Colors.grey.shade400),
                SizedBox(width: 6.0),
                Expanded(
                  flex: 8,
                  child: TextField(
                    controller: phoneController,
                    autofocus: false,
                    maxLines: 1,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(500),
                    ],
                    onChanged: (value) {
                      if (value.length == 12) {
                        if (phoneController != null) {
                          phoneController!.text = value;
                        }
                      }
                    },
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: fontSize ?? 14,
                      fontWeight: fontWeight ?? FontWeight.w500,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      suffix: _clearTextWidget(),
                      hintText: hintPhone,
                      hintStyle: TextStyle(
                        fontFamily: fontFamily ?? ConstantsText.fontFamily,
                        fontSize: fontSize ?? 14,
                        fontWeight: fontWeight ?? FontWeight.w500,
                        color: Colors.grey.shade400,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.fromLTRB(
                        10.0,
                        1,
                        10.0,
                        0,
                      ),
                    ),
                  ),
                ),
                //    IconButton(onPressed: clarPhone, icon: const Icon(Icons.clear)),
              ],
            ),
          ),
        ),
        SizedBox(
          child:
              errorMessage != null
                  ? FadeAnimationDy(
                    delay: 200,
                    dy: 6,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(6.0, 2.0, 6.0, 0),
                      child: Text(
                        (errorMessage ?? '').tr,
                        style: TextStyle(fontSize: 10, color: Colors.red),
                      ),
                    ),
                  )
                  : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
