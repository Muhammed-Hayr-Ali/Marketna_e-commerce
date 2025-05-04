import 'dart:io';

import 'package:application/utils/import.dart';
import 'package:application/widgets/phone_text_field.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  final _ = Get.put<EditProfileController>(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(backButton: true, title: 'Edit Profile'),
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
                                    child: Icon(Icons.delete),
                                    onPressed: () => _.updateImagePath(''),
                                  )
                                  : _.avatar.isNotEmpty
                                  ? CustomCicularButton(
                                    size: 30,
                                    borderWidth: 4,
                                    isLoading: _.isImageLoading,
                                    borderColor: Colors.white,
                                    child: Icon(Icons.edit),
                                    onPressed: () => _.pickImage(true),
                                  )
                                  : CustomCicularButton(
                                    size: 30,
                                    borderWidth: 4,
                                    isLoading: _.isImageLoading,
                                    borderColor: Colors.white,
                                    child: Icon(Icons.camera),
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
                  label: 'Full Name',
                  hintText: 'John Doe',
                  controller: _.nameController,
                  validator: (value) => Validators.name(value!),
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 16.0),

                /// status message
                CustomTextField(
                  label: 'Status Message',
                  hintText: 'Hello world!',
                  controller: _.statusMessageController,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16.0),

                /// email
                CustomButton(
                  backgroundColor: AppColors.grey,
                  label: 'Email',
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
                        child: Icon(Icons.copy),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),

                /// phone number
                Obx(
                  () => PhoneTextField(
                    labelText: 'Phone Number',
                    hintCode: '963',
                    hintPhone: '0987654321',
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
                          label: 'Gender',
                          child: CustomText(
                            _.gender == '' ? 'Not Specified' : _.gender,
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

                          label: 'Date of Birth',
                          child: CustomText(
                            (_.dateBirth == '') ? 'yyyy-MM-dd' : _.dateBirth,
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
