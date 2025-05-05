import 'package:application/utils/import.dart';

class SettingsScreen extends StatelessWidget {
   SettingsScreen({super.key});
final _ = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(backButton: true, title: 'Settings'),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),

          ListTile(
            leading: const Icon(Icons.language),
            title: const CustomText(
              'Language',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: _.updateLanguage,
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
