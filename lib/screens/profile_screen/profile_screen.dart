import 'package:application/utils/import.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final _ = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9EEF2),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomText(AppConstants.PROFILE),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            /// User Info
            GetBuilder<ProfileController>(
              builder:
                  (_) =>
                      _.user == null
                          ? const Center(child: CircularProgressIndicator())
                          : Row(
                            children: [
                              const SizedBox(height: 10),
                              CustomAvatar(
                                borderColor: Colors.white,
                                borderWidth: 4.0,
                                sourceImage: SourceImage.networkImage,
                                size: 64,
                                path: DataConverter.getAvatarUrl(
                                  _.user!.userMetadata!,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    DataConverter.getUserName(
                                      _.user!.userMetadata!,
                                    ),
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  CustomText(
                                    _.user!.email ?? '',
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ],
                          ),
            ),
            SizedBox(height: 32),

            /// menu
            Expanded(
              child: Column(
                children: [
                  MenuItem(
                    title: AppConstants.EDIT_PROFILE,
                    icon: AppAssets.profile,
                    onTap:
                        () => _.navigateToScreen(AppRoutes.EDIT_PROFILE_SCREEN),
                  ),
                  MenuItem(
                    title: AppConstants.MY_ADDRESSES,
                    icon: AppAssets.mapPoint,
                    onTap:
                        () => _.navigateToScreen(
                          AppRoutes.MANAGER_ADDRESSES_SCREEN,
                        ),
                  ),
                  MenuItem(
                    title: AppConstants.MY_ORDERS,
                    icon: AppAssets.delivery,
                    onTap: () {},
                  ),
                  MenuItem(
                    title: AppConstants.SETTINGS,
                    icon: AppAssets.settings,
                    onTap: () => _.navigateToScreen(
                      AppRoutes.SETTINGS_SCREEN,
                    ),
                  ),
                  MenuItem(
                    title: AppConstants.SECURITY,
                    icon: AppAssets.security,
                    onTap: () {},
                  ),
                  MenuItem(
                    title: AppConstants.HELP_CENTER,
                    icon: AppAssets.help,
                    onTap: () {},
                  ),
                  MenuItem(
                    title: AppConstants.LOGOUT,
                    icon: AppAssets.logout,
                    divider: false,
                    onTap: _.signOut,
                  ),
                ],
              ),
            ),

            /// Logout
            // Obx(
            //   () => CustomButton(
            //     isLoading: _.isLoading.value,
            //     onPressed: _.signOut,
            //     buttonColor: AppColors.primaryColor,
            //     progressColor: AppColors.white,
            //     width: double.infinity,
            //     child: CustomText('logout'.tr, color: AppColors.white),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
