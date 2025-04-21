import 'package:application/utils/import.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
            child: const CustomText(
              AppConstants.SETTINGS_TITLE,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),        ],
      ),
    );
  }
}