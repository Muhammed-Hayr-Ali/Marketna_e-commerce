import 'dart:io';

import 'package:application/constants/import.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  final _ = Get.put<EditProfileController>(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(backButton: true, title: AppStrings.editProfile),
      body: Form(
        key: _.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => SizedBox(
                    height: 128,
                    width: 128,
                    child: Stack(
                      children: [
                        _.imagePath.isNotEmpty
                            ? CircleAvatar(
                              radius: 64,
                              backgroundColor: Colors.grey.shade200,
                              backgroundImage: FileImage(File(_.imagePath)),
                            )
                            : _.avatar.isNotEmpty
                            ? CircleAvatar(
                              radius: 64,
                              backgroundColor: Colors.grey.shade200,
                              backgroundImage: NetworkImage(_.avatar),
                            )
                            : CircleAvatar(
                              radius: 64,
                              backgroundColor: Colors.grey.shade200,
                              child: SvgPicture.asset(
                                height: 64,
                                width: 64,
                                AppAssets.avatar,
                              ),
                            ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child:
                              _.imagePath.isNotEmpty
                                  ? CustomCicularButton(
                                    size: 30,
                                    borderWidth: 4,
                                    isLoading: _.isImageLoading,
                                    borderColor: Colors.white,
                                    child: Icon(
                                      Icons.delete,
                                      color: AppColors.rurikonBlue,
                                    ),
                                    onPressed: () => _.updateImagePath(''),
                                  )
                                  : _.avatar.isNotEmpty
                                  ? CustomCicularButton(
                                    size: 30,
                                    borderWidth: 4,
                                    isLoading: _.isImageLoading,
                                    borderColor: Colors.white,
                                    child: Icon(
                                      Icons.edit,
                                      color: AppColors.rurikonBlue,
                                    ),
                                    onPressed: () => _.pickImage(true),
                                  )
                                  : CustomCicularButton(
                                    size: 30,
                                    borderWidth: 4,
                                    isLoading: _.isImageLoading,
                                    borderColor: Colors.white,
                                    child: Icon(
                                      Icons.camera,
                                      color: AppColors.rurikonBlue,
                                    ),
                                    onPressed: () => _.pickImage(false),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 32.0),

                /// name
                CustomTextField(
                  label: AppStrings.fullName,
                  hintText: AppStrings.nameExample,
                  controller: _.nameController,
                  validator: (value) => Validators.name(value!),
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 16.0),

                /// status message
                CustomTextField(
                  label: AppStrings.statusMessage,
                  hintText: AppStrings.statusMessageHint,
                  controller: _.statusMessageController,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16.0),

                /// email
                CustomButton(
                  backgroundColor: AppColors.grey,
                  label: AppStrings.email,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        _.email,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                      GestureDetector(
                        onTap: () => _.copyEmailToClipboard(_.email),
                        child: Icon(Icons.copy, color: AppColors.rurikonBlue),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),

                /// phone number
                Obx(
                  () => PhoneTextField(
                    labelText: AppStrings.phoneNumber,
                    hintCode: AppStrings.countryCodeHint,
                    hintPhone: AppStrings.phoneNumberHint,
                    selectedCode: _.countryCode,
                    phoneController: _.phoneController,
                    onSelectedCode: (cc) => _.updateCountryCode(cc!),
                    errorMessage: _.phoneEM != '' ? _.phoneEM : _.cCodeEMe,
                  ),
                ),
                const SizedBox(height: 16.0),

                /// gender and date of birth
                Obx(
                  () => Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CustomButton(
                          backgroundColor: AppColors.grey,
                          label: AppStrings.gender,
                          child: CustomText(
                            _.gender == '' ? AppStrings.notSpecified : _.gender,
                            color: _.gender == '' ? Colors.grey : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          onPressed: () => _.updateGender(_.gender),
                        ),
                      ),

                      const SizedBox(width: 16.0),

                      Expanded(
                        flex: 1,
                        child: CustomButton(
                          backgroundColor: AppColors.grey,

                          label: AppStrings.dateOfBirth,
                          child: CustomText(
                            textDirection: TextDirection.ltr,
                            (_.dateBirth == '')
                                ? AppStrings.dateFormat
                                : _.dateBirth,
                            color:
                                (_.dateBirth == '')
                                    ? Colors.grey
                                    : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),

                          onPressed: () => _.updateDateOfBirth(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48.0),

                /// Button
                Obx(
                  () => CustomButton(
                    isLoading: _.isUpdateLoading,
                    onPressed: _.updateUserProfile,
                    progressColor: AppColors.white,
                    child: CustomText(
                      AppStrings.updateButtonText,
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
