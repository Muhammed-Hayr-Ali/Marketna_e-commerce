import 'package:application/utils/import.dart';
import 'package:application/widgets/custom_avatar.dart';
import 'package:application/widgets/phone_text_field.dart';

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

        title: const CustomText(ConstantsText.EDIT_PROFILE),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Obx(
                //   () => CustomAvatar(
                //     sourceImage: SourceImage.localImage,
                //     imageUrl: _.imagePath.value,
                //   ),
                // ),
                GetBuilder<EditProfileController>(
                  builder:
                      (_) => Stack(
                        children: [
                          SizedBox(
                            height: 128.0,
                            width: 128.0,
                            child: _.imageLoading? CircularProgressIndicator() : null,
                          ),
                          CustomAvatar(
                            imagePath: _.imagePath,
                            imageUrl: DataConverter.getAvatarUrl(
                              _.user!.userMetadata!,
                            ),
                            onSelectImage: (path) => _.updatePath(path),
                            clearPath: () => _.updatePath(null),
                            onDeleteTap: () => _.deleteImage(true),
                          ),
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
                              label: ConstantsText.FULL_NAME.tr,
                              hintText: ConstantsText.DEFAULT_NAME,
                              controller: _.nameController,
                              validator: (value) => Validators.name(value!),
                              keyboardType: TextInputType.name,
                            ),
                            const SizedBox(height: 16.0),

                            /// email
                            CustomButton(
                              width: double.infinity,
                              label: ConstantsText.EMAIL.tr,
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
                            GetBuilder<EditProfileController>(
                              builder:
                                  (_) => PhoneTextField(
                                    hintPhone: ConstantsText.DEFAULT_PHONE,
                                    hintCode: ConstantsText.DEFAULT_COUNTRY_CODE,
                                    labelText: ConstantsText.PHONE.tr,
                                    selectedCode: _.selectedCountryCode,
                                    phoneController: _.phoneController,
                                    onSelectedCode:
                                        (countryCode) =>
                                            _.updateCountryCode(countryCode),
                                    errorMessage:
                                        _.phoneErrorMessage ??
                                        _.countryCodeErrorMessage,
                                  ),
                            ),

                            const SizedBox(height: 16.0),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: CustomButton(
                                    width: double.infinity,
                                    label: ConstantsText.GENDER.tr,
                                    child: CustomText(
                                      (_.gender == null || _.gender == '')
                                          ? ConstantsText.NOT_SPECIFIED
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
                                    label: ConstantsText.DATE_OF_BIRTH.tr,
                                    child: CustomText(
                                      (_.dateBirth == null || _.dateBirth == '')
                                          ? ConstantsText.DATE_FORMAT
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
                    child: CustomText(
                      ConstantsText.UPDATE,
                      color: AppColors.white,
                    ),
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
