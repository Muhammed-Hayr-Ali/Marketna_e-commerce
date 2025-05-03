import 'package:application/utils/import.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final _ = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomText(ConstantsText.PROFILE),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            GetBuilder<ProfileController>(
              builder:
                  (_) => ProfileWidget(
                    isLoading: _.isLoading,
                    metadata: _.userMetadata,
                  ),
            ),

            /// User Info

            /// menu
            Expanded(
              child: Column(
                children: [
                  MenuItem(
                    title: ConstantsText.EDIT_PROFILE,
                    icon: AppAssets.avatar,
                    onTap: () => _.navigateToScreen(Routes.EDIT_PROFILE_SCREEN),
                  ),
                  MenuItem(
                    title: ConstantsText.MY_ADDRESSES,
                    icon: AppAssets.mapPoint,
                    onTap:
                        () =>
                            _.navigateToScreen(Routes.MANAGER_ADDRESSES_SCREEN),
                  ),
                  MenuItem(
                    title: ConstantsText.MY_ORDERS,
                    icon: AppAssets.delivery,
                    onTap: () {},
                  ),
                  MenuItem(
                    title: ConstantsText.SETTINGS,
                    icon: AppAssets.settings,
                    onTap: () => _.navigateToScreen(Routes.SETTINGS_SCREEN),
                  ),
                  MenuItem(
                    title: ConstantsText.SECURITY,
                    icon: AppAssets.security,
                    onTap: () {},
                  ),
                  MenuItem(
                    title: ConstantsText.HELP_CENTER,
                    icon: AppAssets.help,
                    onTap: () {},
                  ),
                  MenuItem(
                    title: ConstantsText.LOGOUT,
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
            CustomButton(
              child: Text('data'),
              onPressed: () => _.initializeUser(),
            ),
          ],
        ),
      ),
    );
  }
}
