import 'package:application/utils/import.dart';

class ProfileMainController {
  String getAvatarUrl(Map<String, dynamic> userMetadata) {
    return userMetadata['avatar'] ??
        userMetadata['picture'] ??
        userMetadata['avatar_url'] ??
        '';
  }

  String getUserName(User? user) {
    if (user == null) return '';
    return user.userMetadata!['display_name'] ??
        user.userMetadata!['name'] ??
        user.userMetadata!['full_name'] ??
        user.userMetadata!['user_name'] ??
        user.userMetadata!['preferred_username'] ??
        '';
  }

  Future<bool> signOut() async {
    return await custombottomSheet(
      title: 'are_you_sure_logout',

      children: [
        CustomButton(
          width: double.infinity,
          onPressed: () => Get.back(result: false),
          child: CustomText('cancel', fontSize: 12),
        ),
        const SizedBox(height: 16),
        CustomButton(
          width: double.infinity,
          onPressed: () => Get.back(result: true),
          child: CustomText('logout', fontSize: 12),
        ),
      ],
    );
  }
}
