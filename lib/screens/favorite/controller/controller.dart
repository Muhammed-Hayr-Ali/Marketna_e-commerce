import 'package:application/constants/import.dart';

class FavoriteController extends GetxService {
  final _supabase = Supabase.instance.client;
  RxBool isLoading = false.obs;
  RxString message = ''.obs;

  Future<void> upload() async {
    final data = [
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 1,
        "rating_value": 4.5,
        "comment": "جيد جدًا وطازج",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 1,
        "rating_value": 5.0,
        "comment": "ممتاز، أنصح به",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 2,
        "rating_value": 4.0,
        "comment": "جيد ولكن كان يمكن الأفضل",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 2,
        "rating_value": 3.5,
        "comment": "مقبول",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 3,
        "rating_value": 5.0,
        "comment": "أفضل ما استخدمته",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 4,
        "rating_value": 4.0,
        "comment": "جودة ممتازة",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 4,
        "rating_value": 4.5,
        "comment": "سأشتريه مرة أخرى",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 5,
        "rating_value": 3.0,
        "comment": "كالمعتاد",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 6,
        "rating_value": 5.0,
        "comment": "رائع",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 6,
        "rating_value": 4.0,
        "comment": "ممتاز للخبز اليومي",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 7,
        "rating_value": 4.5,
        "comment": "جودة عالية",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 8,
        "rating_value": 4.0,
        "comment": "لقد أعجبني كثيرًا",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 8,
        "rating_value": 3.5,
        "comment": "سعره مرتفع بعض الشيء",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 9,
        "rating_value": 5.0,
        "comment": "ممتاز جدًا",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 10,
        "rating_value": 4.0,
        "comment": "جيد",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 10,
        "rating_value": 4.5,
        "comment": "نكهة رائعة",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 11,
        "rating_value": 3.0,
        "comment": "كما هو متوقع",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 12,
        "rating_value": 5.0,
        "comment": "من أفضل المنتجات",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 12,
        "rating_value": 4.0,
        "comment": "جودة ممتازة",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 13,
        "rating_value": 3.5,
        "comment": "مقبول",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 14,
        "rating_value": 4.5,
        "comment": "جميل وسهل الاستخدام",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 14,
        "rating_value": 5.0,
        "comment": "أفضل من المتوقع",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 15,
        "rating_value": 4.0,
        "comment": "جيد",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 16,
        "rating_value": 5.0,
        "comment": "ممتاز",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 17,
        "rating_value": 4.5,
        "comment": "نكهته جميلة",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 17,
        "rating_value": 4.0,
        "comment": "جيدة لكن تحتاج لتحديث",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 18,
        "rating_value": 3.5,
        "comment": "لم يعجبني تمامًا",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 19,
        "rating_value": 5.0,
        "comment": "ممتاز، أنصح به",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 20,
        "rating_value": 4.0,
        "comment": "جودة جيدة",
      },
      {
        "user_id": "b200d43e-59eb-40e0-8102-45af8e415c12",
        "product_id": 20,
        "rating_value": 4.5,
        "comment": "رائع",
      },
    ];
    try {
      isLoading.value = true;
      message.value = '';
      final response = await _supabase
          .from(TableNames.productsReviews)
          .insert(data);

      if (response == null) {
        message.value = response.error!.message;
      } else {
        message.value = 'uploaded Data Successfully';
      }
    } catch (e) {
      message.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
