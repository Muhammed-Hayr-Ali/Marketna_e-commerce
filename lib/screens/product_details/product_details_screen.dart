import 'package:application/utils/import.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Get.arguments as Product?;
    if (product == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: CustomText('Product Not Found')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: product.id!,
              transitionOnUserGestures: true,
              child: CachedNetworkImage(
                height: 360,
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl: product.imageUrl!,
                imageBuilder:
                    (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget:
                    (context, url, error) =>
                        Icon(Icons.error, color: Colors.red),
              ),
            ),
            const SizedBox(height: 28.0),
            CustomText(
              product.name ?? '',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 4.0),
            CustomText(
              product.category ?? 'No Category',
              fontSize: 12,
              color: Colors.grey,
            ),
            const SizedBox(height: 8.0),
            CustomText(
              product.price != null
                  ? 'Price: \$${product.price}'
                  : 'Price Not Available',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),

            const SizedBox(height: 8.0),

            const SizedBox(height: 8.0),
            Text(product.description ?? 'No Description'),
          ],
        ),
      ),
    );
  }
}
