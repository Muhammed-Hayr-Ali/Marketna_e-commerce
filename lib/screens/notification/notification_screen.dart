import 'package:application/utils/import.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomText('Notification'),
      ),
      body: Center(child: CustomText('NotificationScreen')),
    );
  }
}
