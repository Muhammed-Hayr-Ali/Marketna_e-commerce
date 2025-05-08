import 'package:application/utils/import.dart';

class FavoriteController extends GetxService {
  final _supabase = Supabase.instance.client;
  RxBool isLoading = false.obs;

  Future<void> addNewCountry() async {
    try {
      CountryModel country = CountryModel(
        name: 'test',
        nameAr: 'test',
        code: 'test',
        flag: 'test',
        emoji: 'test',
        emojiU: 'test',
        isoCode: 'test',
        province: [
          Province(name: 'test', nameAr: 'test', city: [City(name: 'test')]),
        ],
      );

      final response = await _supabase
          .from(TableNames.countries)
          .insert(country.toJson());
      debugPrint('response : $response');
    } on Exception catch (error) {
      CustomNotification.showSnackbar(message: error.toString());
      debugPrint(error.toString());
    }
  }

  Future<void> loginUser() async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: 'm.thelord963@gmail.com',
        password: 'Aa99009900',
      );
      debugPrint('response : $response');
    } on Exception catch (error) {
      CustomNotification.showSnackbar(
        message: 'Something has gone wrong somewhere',
      );
      debugPrint(error.toString());
    }
  }
}
