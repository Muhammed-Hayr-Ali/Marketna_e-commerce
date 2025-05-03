import 'package:application/utils/import.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
            child: Row(
              children: [
                const CustomText(
                  ConstantsText.SETTINGS_TITLE,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const CustomText(
              ConstantsText.NOTIFICATIONS,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const CustomText(
              'language',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const CustomText(
              ConstantsText.PRIVACY_POLICY,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const CustomText(
              ConstantsText.ABOUT,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const CustomText(
              ConstantsText.LOGOUT,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle logout action
            },
          ),
          const Spacer(),
          Center(
            child: CustomText(
              'version ${ConstantsText.VERSION}',
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
