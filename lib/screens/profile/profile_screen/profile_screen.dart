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

            ProfileWidget(),
            /// User Info
            // GetBuilder<ProfileController>(
            //   builder:
            //       (_) =>
            //           _.user == null
            //               ? SizedBox.shrink()
            //               : Row(
            //                 children: [
            //                   const SizedBox(height: 10),
            //                   Container(
            //                     height: Get.width * 0.2,
            //                     width: Get.width * 0.2,
            //                     decoration: BoxDecoration(
            //                       color: Colors.grey.shade300,
            //                       borderRadius: BorderRadius.circular(999),
            //                     ),
            //                     child:
            //                         _.user!.userMetadata![ConstantsText
            //                                     .AVATAR] &&
            //                                 _.user!.userMetadata![ConstantsText
            //                                         .AVATAR_URL] ==
            //                                     null
            //                             ? Padding(
            //                               padding: const EdgeInsets.all(14.0),
            //                               child: SvgPicture.asset(
            //                                 AppAssets.profile,
            //                               ),
            //                             )
            //                             : ClipRRect(
            //                               borderRadius: BorderRadius.circular(
            //                                 999,
            //                               ),
            //                               child: CachedNetworkImage(
            //                                 fit: BoxFit.cover,
            //                                 imageUrl:
            //                                     _
            //                                         .user!
            //                                         .userMetadata![ConstantsText
            //                                         .AVATAR] ??
            //                                     _
            //                                         .user!
            //                                         .userMetadata![ConstantsText
            //                                         .AVATAR_URL],

            //                                 placeholder: (context, url) {
            //                                   return Shimmer.fromColors(
            //                                     baseColor: Colors.white,
            //                                     highlightColor:
            //                                         Colors.grey.shade100,
            //                                     child: Container(
            //                                       height: Get.width * 0.2,
            //                                       width: Get.width * 0.2,
            //                                       decoration: BoxDecoration(
            //                                         color: Colors.grey.shade300,
            //                                         borderRadius:
            //                                             BorderRadius.circular(
            //                                               999,
            //                                             ),
            //                                       ),
            //                                     ),
            //                                   );
            //                                 },

            //                                 errorWidget: (context, url, error) {
            //                                   return Center(
            //                                     child: Icon(
            //                                       Icons.error,
            //                                       color: Colors.grey,
            //                                     ),
            //                                   );
            //                                 },
            //                               ),
            //                             ),
            //                   ),

            //                   const SizedBox(width: 12),
            //                   Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       CustomText(
            //                         DataConverter.getUserName(
            //                           _.user!.userMetadata!,
            //                         ),
            //                         fontSize: 22,
            //                         fontWeight: FontWeight.w500,
            //                       ),
            //                       CustomText(
            //                         _.user!.email ?? '',
            //                         fontSize: 12,
            //                         color: Colors.grey,
            //                       ),
            //                     ],
            //                   ),
            //                 ],
            //               ),
            // ),
            // SizedBox(height: 32),

            /// menu
            Expanded(
              child: Column(
                children: [
                  MenuItem(
                    title: ConstantsText.EDIT_PROFILE,
                    icon: AppAssets.profile,
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
          ],
        ),
      ),
    );
  }
}
