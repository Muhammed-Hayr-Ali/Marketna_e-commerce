import 'package:application/utils/import.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomText('Favorite'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: CustomText('FavoriteScreen')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromRadius(16),
              backgroundColor: Colors.grey.shade200,
              shadowColor: Colors.transparent,
              elevation: 0,
              shape: CircleBorder(),
              padding: EdgeInsets.zero,
            ),
            onPressed: () {
              Get.toNamed(Routes.IMAGE_PICKER);
            },
            child: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
