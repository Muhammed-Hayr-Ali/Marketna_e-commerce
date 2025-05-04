import 'package:application/utils/import.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final _ = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Profile'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Obx(
              () => ProfileWidget(isLoading: _.isLoading, metadata: _.metadata),
            ),

            /// User Info
            SizedBox(height: 32),

            /// menu
            Expanded(
              child: Column(
                children: [
                  MenuItem(
                    title: 'Edit Profile',
                    icon: AppAssets.avatar,
                    onTap: () => _.navigateToScreen(Routes.EDIT_PROFILE_SCREEN),
                  ),
                  MenuItem(
                    title: 'My Addresses',
                    icon: AppAssets.mapPoint,
                    onTap:
                        () =>
                            _.navigateToScreen(Routes.MANAGER_ADDRESSES_SCREEN),
                  ),
                  MenuItem(
                    title: 'My Orders',
                    icon: AppAssets.delivery,
                    onTap: () {},
                  ),
                  MenuItem(
                    title: 'Settings',
                    icon: AppAssets.settings,
                    onTap: () => _.navigateToScreen(Routes.SETTINGS_SCREEN),
                  ),
                  MenuItem(title: 'Help', icon: AppAssets.help, onTap: () {}),
                  MenuItem(
                    title: 'Logout',
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
