import 'package:application/utils/import.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final _ = Get.put(ProfileController());
  final _main = ProfileMainController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9EEF2),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomText('profile'),
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
                                path: ProfileMainController().getAvatarUrl(
                                  _.user!.userMetadata!,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    _main.getUserName(_.user),
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
                    title: 'edit_profile',
                    icon: AppAssets.profile,
                    onTap:
                        () => _.navigateToScreen(AppRoutes.editProfileScreen),
                  ),
                  MenuItem(
                    title: 'my_addresses',
                    icon: AppAssets.mapPoint,
                    onTap:
                        () =>
                            _.navigateToScreen(AppRoutes.manageAddressesScreen),
                  ),
                  MenuItem(
                    title: 'my_orders',
                    icon: AppAssets.delivery,
                    onTap: () {},
                  ),
                  MenuItem(
                    title: 'settings',
                    icon: AppAssets.settings,
                    onTap: () {},
                  ),
                  MenuItem(
                    title: 'security',
                    icon: AppAssets.security,
                    onTap: () {},
                  ),
                  MenuItem(
                    title: 'help_center',
                    icon: AppAssets.help,
                    onTap: () {},
                  ),
                  MenuItem(
                    title: 'logout',
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
