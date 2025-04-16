import 'package:application/utils/import.dart';

class ProfileMainController {
  /// Gets the avatar URL from the user's metadata.
  ///
  /// This function takes a [Map] of user metadata and returns the value of the
  /// 'avatar', 'avatar_url', or 'picture' key. If none of these keys is
  /// present, it returns an empty string.
  ///
  /// [userMetadata] A map of user metadata as returned by the Supabase client.
  /// [returns] The avatar URL or an empty string if none is present.
  String? getAvatarUrl(Map<String, dynamic> userMetadata) =>
      userMetadata['avatar'] ??
      userMetadata['avatar_url'] ??
      userMetadata['picture'];

  String getUserName(User? user) {
    if (user == null) return '';
    return user.userMetadata!['display_name'] ??
        user.userMetadata!['name'] ??
        user.userMetadata!['full_name'] ??
        user.userMetadata!['user_name'] ??
        user.userMetadata!['preferred_username'] ??
        '';
  }

  Future<bool> shouldSignOut() async {
    return await custombottomSheet<bool>(
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
        ) ??
        false;
  }
}
