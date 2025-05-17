import 'package:application/constants/import.dart';
import 'package:application/models/product_image_model.dart';

class ProductDetailsController extends GetxController {
  final int? productId;
  ProductDetailsController({this.productId});


  // 🔧 Instance
  final _supabase = Supabase.instance.client;

  // General Variables
  bool isLoading = true;
  String? error;
  ProductFullDetailsModel? productDetails;
  List<ProductImageModel> imagesList = [];


@override
  onInit() {
    super.onInit();
    _fetchProductDetails(productId: productId!);
  }

  Future<ProductFullDetailsModel?> _fetchProductDetails({
    required int productId,
  }) async {
    try {
      final response =
          await _supabase
              .from(TableNames.productDetails)
              .select('''*,
              product_attributes(key, value),
              product_categories(name),
              product_images(image_url),
              product_qualities(name),
              product_reviews(rating_value, comment, user_profiles(display_name , name, full_name ,user_name ,preferred_username, avatar, avatar_url, picture))
              ''')
              .eq(ColumnNames.id, productId)
              .single();
      /// debugPrint(response.toString());
      
      productDetails = ProductFullDetailsModel.fromJson(response);
    } catch (error) {
      debugPrint(error.toString());
    } finally {
      isLoading = false;
      update();
    }
    return null;
  }

  // product_attributes(key, value),
  //                       product_categories(name),
  //                       product_images(image_url),
  //                       product_qualities(name),
  //                       product_reviews(rating_value, comment, user_profiles(displayName , name, fullName ,userName ,preferredUsername, avatar, avatar_url, picture)),

  void updateCurrentImage(int index) {}
}
