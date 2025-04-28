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
          CustomCicularButton(
            onPressed: () {
              print('object');
            },
            size: 100,
            borderColor: const Color.fromARGB(255, 229, 230, 229),
            progressWidth: 5,
            progressColor: Colors.red,
            progressPadding: 5,
            borderWidth: 10,
            loadingValue: 0.5,
            backgroundColor: const Color.fromARGB(255, 230, 230, 230),
            child: Icon(Icons.send, size: 50),
          ),
        ],
      ),
    );
  }
}
