import 'package:application/utils/import.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  final _ = Get.put<EditProfileController>(EditProfileController());
  final _main = EditProfileMainController();

  void _selectGender() async {
    final result = await _main.openGenderBottomSheet(_.gender);
    _.updateGender(result);
  }

  void _selectDate() async {
    final result = await _main.openDateOfBirth(initialDate: _.dateBirth);
    if (result == null) return;
    debugPrint(result.toString());
    _.updateDateBirth(result.toString().substring(0, 10));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(Icons.arrow_back_ios),
        ),

        title: const CustomText('edit_profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GetBuilder<EditProfileController>(
                  builder:
                      (_) => Stack(
                        alignment: Alignment.center,

                        children: [
                          Obx(
                            () => SizedBox(
                              width: 100,
                              height: 100,
                              child:
                                  _.imageIsLoading.value
                                      /// is loading
                                      ? CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: AppColors.primaryColor,
                                      )
                                      : null,
                            ),
                          ),
                          CustomAvatar(
                            sourceImage: SourceImage.networkImage,
                            size: 100,
                            path: DataConverter.getAvatarUrl(
                              _.user!.userMetadata!,
                            ),
                            onTap: _.selectImageSource,
                            childColor: Colors.grey.shade200,
                            child: SvgPicture.asset(
                              AppAssets.camera,
                              colorFilter: ColorFilter.mode(
                                AppColors.admiralBlue,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          _.imagePath != null
                              ? CustomAvatar(
                                sourceImage: SourceImage.localImage,
                                size: 100,
                                path: _.imagePath!,
                                onTap: _.clearImagePath,
                                childColor: Colors.grey.shade200,
                                child: SvgPicture.asset(
                                  AppAssets.trashBin,
                                  colorFilter: ColorFilter.mode(
                                    Colors.red,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              )
                              : SizedBox.shrink(),
                        ],
                      ),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _.formKey,
                  child: GetBuilder<EditProfileController>(
                    builder:
                        (_) => Column(
                          children: [
                            SizedBox(height: 20),

                            /// name
                            CustomTextField(
                              label: 'full_name'.tr,
                              hintText: 'John Doe'.tr,
                              controller: _.nameController,
                              validator: (value) => Validators.name(value!),
                              keyboardType: TextInputType.name,
                            ),
                            const SizedBox(height: 16.0),

                            /// email
                            CustomButton(
                              width: double.infinity,
                              label: 'email'.tr,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    _.email ?? '',
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  GestureDetector(
                                    onTap: _.copyEmailToClipboard,
                                    child: Icon(Icons.copy),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 16.0),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    textDirection: TextDirection.ltr,
                                    label: 'phone'.tr,
                                    hintText: '991234567',
                                    controller: _.phoneController,
                                    validator:
                                        (value) => Validators.phone(value!),
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]'),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(width: 16.0),

                                CustomCountryPicker(
                                  countryPickerMode: CountryPickerMode.code,
                                  initCode: _.countryCode,
                                  onChangedCountry: ({
                                    required name,
                                    required code,
                                  }) {
                                    _.updateCountryCode(code);
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: CustomButton(
                                    width: double.infinity,
                                    label: 'gender'.tr,
                                    child: CustomText(
                                      (_.gender == null || _.gender == '')
                                          ? 'not_specified'
                                          : _.gender!,
                                      color:
                                          (_.gender == null || _.gender == '')
                                              ? Colors.grey
                                              : Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    onPressed: () => _selectGender(),
                                  ),
                                ),

                                const SizedBox(width: 16.0),

                                Expanded(
                                  flex: 1,
                                  child: CustomButton(
                                    width: double.infinity,
                                    label: 'date_of_birth'.tr,
                                    child: CustomText(
                                      (_.dateBirth == null || _.dateBirth == '')
                                          ? 'dd-mm-yyyy'
                                          : _.dateBirth!,
                                      color:
                                          (_.dateBirth == null ||
                                                  _.dateBirth == '')
                                              ? Colors.grey
                                              : Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    onPressed: () => _selectDate(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                  ),
                ),

                // const SizedBox(height: 48.0),
                // CustomButton(
                //   child: CustomText('openCupertinoDatePicker'),
                //   onPressed: () => _main.openCupertinoDatePicker(initialDate: _.dateBirth,
                //       ),
                // ),
                const SizedBox(height: 48.0),

                Obx(
                  () => CustomButton(
                    width: double.infinity,
                    isLoading: _.isLoading.value,
                    onPressed: _.updateUser,
                    buttonColor: AppColors.primaryColor,
                    progressColor: AppColors.white,
                    child: CustomText('update', color: AppColors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
